jQuery ->
  $.ajax {
    dataType: "html",
    url: "./data/description.md",
    success: (data)->
      $('#description').html( markdown.toHTML(data))
      
  }

  #
  #
  #
  # Info
  #
  $.ajax {
    dataType: "json",
    url: "./data/Info.json",
    success: (data)->
      $('title').render(data.person,title_directive)
      $('meta[name=author]').render(data.person,meta_directive)
      $('meta[name=description]').render(data.person,meta_description_directive)
      $('meta[name=keywords]').render(data.person,meta_keywords_directive)
      #
      $('div#photo').autoRender(data.person)
      $('div#who').autoRender(data.person)
      $('div#contact').autoRender(data.contact)
      $('div#links').autoRender(data)
      $('div#education').render(data,edu_directive)
      $('div#projects').autoRender(data)
      $('div#experience').autoRender(data)
      $('div.last_updated').autoRender(data)
      $('div#logos').autoRender(data)
  }

  #
  # lookup for data-prefix and data-suffix in the el
  write_content = (el,content) ->
    return "" if jQuery.trim(content) == ""
    element = $(el)
    prefix  = element.data("prefix")
    suffix  = element.data("suffix")
    prefix  = "" if typeof(prefix) == "undefined"
    suffix  = "" if typeof(suffix) == "undefined"
    prefix + content + suffix
  
  title_directive = {     
    '+.': (args) ->
          args.context.name
  }

  meta_directive = {     
    '.@content': (args) ->
          args.context.name
  }

  meta_description_directive = {     
    '.@content+': (args) ->
          args.context.name
  }

  meta_keywords_directive = {     
    '.@content': (args) ->
          args.context.keywords
  }

  edu_directive = { 
    'li.education': {
      'education<-education': {
        '.description'  : (args) -> write_content(".description"  , @["description"])
        '.thesis-title' : (args) -> write_content(".thesis-title" , @["thesis-title"])
        '.supervisor'   : (args) -> write_content(".supervisor"   , @["supervisor"])
        '.co-supervisor': (args) -> write_content(".co-supervisor", @["co-supervisor"])
        '.range'        : (args) -> write_content(".range"        , @["range"])
        '.where'        : (args) -> write_content(".where"        , @["where"])
        '.where@href'   : 'education.site'
      }
    }
  }
  
  #
  #
  # Article directive for templating
  # 
  directive = { 
    'li.article-item': {
      'article<-articles': {
        '.title   span': (args) -> write_content(".title"   , @title)
        '.journal span': (args) -> 
          title = if typeof(@["container-title"]) != "undefined"
            @["container-title"]
          else if typeof(@["event"]) != "undefined"
            @["event"] + if typeof(@["event-place"]) != "undefined"
              ", " + @["event-place"]
            else
              ""
          else
            ""
          write_content(".journal" , title)
        '.pages   span': (args) -> write_content(".page"    , @page)
        '.volume  span': (args) -> write_content(".volume"  , @volume)
        '.issue   span': (args) -> write_content(".issue"   , @issue)
        '.series  span': (args) -> write_content(".series"  , @series)

        '.year span': (args) ->
          args.article.item.issued["date-parts"][0][0]

        'li.author': {
          'author_name<-article.author': {
            '.family-name': (args)-> write_content(".family-name", @family)
            '.given-name' : (args)-> write_content(".given-name" , @given)
          }
        }
        
        '.url a': (args)->
          if typeof(@DOI) != "undefined"
            @DOI
          else if typeof(@URL) != "undefined"
            "link"
          else
            ""
        '.url a@href':'article.URL'
      }
      sort: (a,b)->
        a.issued["date-parts"][0][0] < b.issued["date-parts"][0][0] ? 1 : -1
    }
  }

  #
  #
  #
  # Journals
  #
  $.ajax {
    dataType: "json",
    url: "./data/Journal.json",
    success: (data)->
      new_data = {
        "articles": data
      }
      $('div#journals ol.articles-list').render(new_data,directive)
  }
  
  #
  #
  #
  # Conference
  #
  $.ajax {
    dataType: "json",
    url: "./data/Oral.json",
    success: (data)->
      new_data = {
        "articles": data
      }
      $('div#conferences ol.articles-list').render(new_data,directive)
  }

  #
  #
  #
  # Poster
  #
  $.ajax {
    dataType: "json",
    url: "./data/Poster.json",
    success: (data)->
      new_data = {
        "articles": data
      }
      $('div#posters ol.articles-list').render(new_data,directive)
  }

  #
  #
  #
  # Invited
  #
  $.ajax {
    dataType: "json",
    url: "./data/Invited.json",
    success: (data)->
      new_data = {
        "articles": data
      }
      $('div#invited-talks ol.articles-list').render(new_data,directive)
  }
