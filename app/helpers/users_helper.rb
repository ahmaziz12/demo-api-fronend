module UsersHelper
  def get_teachings(teachings)
    if teachings.present?
       teachings = (((teachings/100).ceil)*(100)) if teachings > 99
       teachings.to_s + '+'
    else
      '0'
    end
  end
end
