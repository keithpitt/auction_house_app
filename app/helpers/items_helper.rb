module ItemsHelper

  def show_gold(cost)
    gold = (cost/10000).floor
    silver = ((cost % 10000) / 100).floor
    copper = cost % 100

    result = []
    result << "<span class=\"money_gold\">#{gold}</span>" if gold > 0
    result << "<span class=\"money_silver\">#{silver}</span>" if silver > 0
    result << "<span class=\"money_copper\">#{copper}</span>" if copper > 0

    return result.join(' ')
  end

end
