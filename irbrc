#!/usr/bin/ruby
require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'

IRB.conf[:PROMPT_MODE] = :SIMPLE

IRB.conf[:AUTO_INDENT] = true

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
end

def pbcopy
  last_value = IRB.CurrentContext.last_value
  %x[echo '#{last_value}' | pbcopy]
  "copied \`#{last_value}' to your clipboard"
end
