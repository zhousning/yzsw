module TemplatesHelper
  def type_options
    [["string", "string"], ["float", "float"], ["integer", "integer"], ["text", "text"], ["datetime", "datetime"],["date", "date"], ["boolean", "boolean"]]
  end

  def options_for_tag 
    [["text", "text"], ["textarea", "textarea"], ["number", "number"], ["phone", "phone"], ["datetime", "datetime"], ["date", "date"], ["password", "password"], ["phone", "phone"], ["email", "email"], ["radio", "radio"], ["select","select"]]
  end                                            

  def options_for_wxtag 
    [["text", "text"], ["text_icon", "text_icon"], ["text_btn", "text_btn"], ["textarea", "textarea"], ["picker", "picker"], ["multi_picker", "multi_picker"], ["time", "time"], ["date", "date"], ["address", "address"], ["image", "image"], ["radio", "radio"], ["checkbox","checkbox"], ["switch", "switch"]]
  end                                            

  def options_for_type
    [["has_one", "has_one"], ["has_many", "has_many"], ["belongs_to", "belongs_to"]]
  end                                            

  def options_for_template
    [
      [Setting.engines.swjt1tmpt, Setting.engines.swjt1tmpt],
      [Setting.engines.swjt2tmpt, Setting.engines.swjt2tmpt],
      [Setting.engines.zctmpt, Setting.engines.zctmpt],
      [Setting.engines.jxtmpt, Setting.engines.jxtmpt]
    ]
  end

  def engine_template(engine) 
    str = ''
    if engine.template == Setting.engines.swjt1tmpt
      str = 'application_home'
    elsif engine.template == Setting.engines.swjt2tmpt
      str = 'application_home'
    elsif engine.template == Setting.engines.zctmpt
      str = 'application_zchome'
    elsif engine.template == Setting.engines.jxtmpt
      str = 'application_home'
    end
    str
  end

  def determine_home_index_template(engine)
    str = ''
    if engine.template == Setting.engines.swjt1tmpt
      str = 'home/swjt1index'
    elsif engine.template == Setting.engines.swjt2tmpt
      str = 'home/swjt1index'
    elsif engine.template == Setting.engines.zctmpt
      str = 'home/zcindex'
    elsif engine.template == Setting.engines.jxtmpt
      str = 'home/jxindex'
    end
    str
  end
end  
