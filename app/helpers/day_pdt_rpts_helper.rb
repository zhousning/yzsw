module DayPdtRptsHelper

  def options_for_my_factory(factories)
    str = ""
    factories.each do |f|
      str += "<option value='" + idencode(f.id).to_s + "'>" + f.name + "</option>"
    end

    raw(str)
  end

  def options_for_article_ctg(article)
    str = ""
    secd_id = nil
    secd_id = article.secd.id if article.secd
    
    @frsts = Frst.all
    @frsts.each do |frst|
      text = frst.name
      frst.secds.each do |secd|
        if secd_id == secd.id 
          str += "<option selected='selected' value='" + idencode(secd.id).to_s + "'>" + text + '-' + secd.name + "</option>"
        else
          str += "<option value='" + idencode(secd.id).to_s + "'>" + text + '-' + secd.name + "</option>"
        end
      end
    end

    raw(str)
  end

  def options_for_wxtool_secds
    arr = []
    Secd.all.each do |secd|
      arr << [secd.name, secd.id]
    end
    arr
  end

  def options_for_factories
    str = ""
    Factory.all.each do |f|
      str += "<option value='" + idencode(f.id).to_s + "'>" + f.name + "</option>"
    end

    raw(str)
  end

  def options_for_quotas
    str = ""
    quotas = Quota.all
    quotas.each do |f|
      title = f.name.gsub(/在线-|化验-/, '')
      str += "<option value='" + f.code.to_s + "'>" + title + "</option>"
    end

    raw(str)
  end

  def options_for_device_state
    [
      [Setting.devices.state_normal, Setting.devices.state_normal],
      [Setting.devices.state_repair, Setting.devices.state_repair],
      [Setting.devices.state_stop, Setting.devices.state_stop]
    ]
  end

  def options_for_mudfcts(factory)
    hash = Hash.new
    mudfcts = factory.mudfcts
    mudfcts.each do |f|
      hash[f.name] = f.id.to_s
    end
    hash
  end

  def mudfcts_hash(factory)
    hash = Hash.new
    mudfcts = factory.mudfcts
    mudfcts.each do |f|
      hash[f.id.to_s] = f.name
    end
    hash
  end

  def options_for_chemicals
    hash = Hash.new
    ctgs = ChemicalCtg.all
    ctgs.each do |f|
      hash[f.name] = f.code
    end
    hash
  end

  def chemicals_hash
    hash = Hash.new
    ctgs = ChemicalCtg.all
    ctgs.each do |f|
      hash[f.code] = f.name
    end
    hash
  end

  def options_for_emp_quotas
    str = "<option value='" + Setting.quota.cod + "'>" + cms_sub_pref(Setting.inf_qlties.cod) + "</option>" + "<option value='" + Setting.quota.nhn + "'>" + cms_sub_pref(Setting.inf_qlties.nhn) + "</option>" + "<option value='" + Setting.quota.tn + "'>" + cms_sub_pref(Setting.inf_qlties.tn) + "</option>" + "<option value='" + Setting.quota.tp + "'>" + cms_sub_pref(Setting.inf_qlties.tp) + "</option>"
    raw(str)
  end

  def options_for_years
    year = Time.new.year
    str = ""
    years = (2019..year).to_a.reverse
    years.each do |year|
      str += "<option value='" + year.to_s + "'>" + year.to_s + "</option>"
    end

    raw(str)
  end

  def options_for_mth_months
    str = ""
    months.each_pair do |k, v|
      str += "<option value='" + k + "'>" + v + "</option>"
    end
    raw(str)
  end

  def cms_sub_pref(title)
    title = title.gsub(/在线-|化验-/, '')
    title
  end

  def zchome_setion_background(index)
    str = ''
    if index == 0 || index == 3 || index == 6 
      str = 'bg-b2882d'
    elsif index == 1 || index == 4 || index == 7 
      str = 'bg-255481'
    elsif index == 2 || index == 5 || index == 8  
      str = 'bg-228466'
    end
    str
  end

  def options_for_secds
    [
      [Setting.secds.sindex, Setting.secds.sindex],
      [Setting.secds.sshow, Setting.secds.sshow],
      [Setting.secds.slink, Setting.secds.slink]
    ]
  end

end  
