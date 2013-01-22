# encoding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "一代宗師"
    image "http://img3.douban.com/spic/s24591423.jpg"
    director ["王家卫 Kar Wai Wong"]
    cast   ["梁朝伟 Tony Leung Chiu Wai",
            "章子怡 Ziyi Zhang",
            "张震 Chen Chang",
            "宋慧乔 Hye-kyo Song",
            "赵本山 Benshan Zhao",
            "小沈阳 Xiao Shen-Yang",
            "王庆祥 Qingxiang Wang",
            "张晋 Jin Zhang",
            "卢海鹏 Hoi-Pang Lo",
            "冯克安 Hark-On Fung",
            "刘家勇",
            "张智霖 Julian Cheung",
            "金士杰 Shi-Jye Jin",
            "徐锦江 Elvis Tsui",
            "刘洵 Shun Lau"]
    movie_type ["剧情", "动作", "传记"]
    pubdate ["2013-01-08(中国大陆)", "2013-01-10(香港)"]
    country ["中国大陆", "香港"]
    language ["汉语普通话"]
    movie_duration "130"
    movie_edition ["版本"]
    rating max: 10, average: 7.6, numRaters: 72880, min: 0
    summary "广东佛山人叶问（梁朝伟 饰），年少时家境优渥，师从咏春拳第三代传人陈华顺学习拳法，师傅“一条腰带一口气”的告诫，支持他走过兵荒马乱、朝代更迭的混乱年代。妻子张永成（宋慧乔 饰）泼辣干练，二人夫唱妇随，琴瑟合壁。\n1936年，佛山武术界乱云激荡。八卦拳宗师宫羽田（王庆祥 饰）年事已高，承诺隐退。其所担任的中华武士会会长职位，自然引起武林高手的关注与觊觎。包括宫羽田的独生女宫二（章子怡 饰）在内，白猿马三（张晋 饰）、关东之鬼丁连山（赵本山 饰）、咏春叶问等高手无不将目光聚焦在正气凛然的宫羽田身上。拳有南北，国有南北乎？最有德行之人才堪会长重任，然这浮世虚名却引得无数迷乱之人狂醉奔忙，浪掷残生。生逢乱世，儿女情长埋藏心底，被冷若寒冰的车轮碾作碎泥……"
    douban_id "3821067"
    is_screening false

    factory :screening_movie do
      is_screening true
    end
  end

end
