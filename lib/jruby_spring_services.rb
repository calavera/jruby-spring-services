module JrubySpringServices
  import javax.servlet.ServletContext
  import org.springframework.web.context.WebApplicationContext
  import org.springframework.web.context.support.WebApplicationContextUtils
  import org.springframework.context.support.ClassPathXmlApplicationContext

  attr_accessor :context_file

  module ClassMethods
    @spring_context = nil

    def spring_context
      @spring_context ||= begin
        if Rails.env == 'test'
          ClassPathXmlApplicationContext.new(context_file || "applicationContext.xml")
        else
          WebApplicationContextUtils.getWebApplicationContext($servlet_context)
        end
      end
    end

    def bean(bean_name)
      spring_context.getBean(bean_name)
    end

    def include_spring_bean(bean_names = [])
      raise "Initialization error: you must specify one bean at least" unless bean_names || bean_names.to_a.empty?

      bean_names.to_a.each do |bean_name|
        define_method bean_name do
          @bean ||= bean(bean_name)
        end
      end
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end
