module ConditionalCommentHelper
  
  # More info on Conditional Comments: http://msdn.microsoft.com/en-us/library/ms537512(VS.85).aspx
  
  def conditional_comment(options = {})
    if options[:version]
      version = options[:version].to_s.gsub('_', ' ').downcase
      parts = version.match(/^(not\s*)?((less|greater)\s+than(\s+or\s+equal\s+to)?\s*)?(\d)?$/)
      
      throw "Invalid version string" unless parts
      
      condition = "IE"
      
      condition << " " + parts[5] if parts[5]
      
      if parts[2] && parts[5]
        comparison = case parts[3]
          when 'greater': 'gt'
          when 'less': 'lt'
        end
        comparison << 'e' if parts[4]

        condition = [comparison, condition].join(" ")
      end
      
      if parts[1]
        condition = "!(#{condition})"
      end
    else
      condition = "IE"
    end
    
    "<!--[if #{condition}]>#{yield}<![endif]-->"
  end
  
end