

class GildedRose

  def initialize(items)
    @items = items
  end
  
  def update_quality
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality.positive? && (item.name != "Sulfuras, Hand of Ragnaros")
          item.quality = item.quality - 1
        end
      elsif item.quality < 50
        item.quality = item.quality + 1
        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          if item.sell_in < 11 && (item.quality < 50)
            item.quality = item.quality + 1
          end
          if item.sell_in < 6 && (item.quality < 50)
            item.quality = item.quality + 1
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in.negative?
        if item.name != "Aged Brie"
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            item.quality = item.quality - item.quality
          elsif item.quality.positive? && (item.name != "Sulfuras, Hand of Ragnaros")
            item.quality = item.quality - 1
          end
        elsif item.quality < 50
          item.quality = item.quality + 1
        end
      end
    end
  end
end
  
