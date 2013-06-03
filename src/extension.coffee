###
// ==UserScript==
// @name          diumoo helper
// @namespace     http://notimportant.org
// @require       http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.js
// @description   diumoo helper for browsers
// @copyright     2012, Sean Lee (http://notimportant.org/)
// @author        Sean Lee
// @include       http://music.douban.com/*
// @include       http://movie.douban.com/*
// @include       http://site.douban.com/*
// @version       0.2
// ==/UserScript==
###

return false if window isnt window.top

# GM_xmlhttpRequest = BabelExt.xhr
# GM_setValue = localStorage.setItem
# GM_getValue = localStorage.getItem
# GM_deleteValue = localStorage.removeItem
# GM_openInTab = BabelExt.tabs.create
# GM_addStyle = BabelExt.css.add

# GM_addStyle "#diumoo-notification{margin:0;padding:0}#diumoo-notification p{line-height:2.2em;margin:0}a.diumoo-icon{margin-left:3px}a.diumoo-icon img{width:14px}a.diumoo-icon:hover{background:#fff}a.diumoo-icon:hover img{})"


SCHEME = "diumoo"
ICON_SRC = "http://diumoo.github.com/favicon.ico"
# PLAYDIUMOO_SRC = "http://diumoo.net/static/playindiumoo.png"
PLAYDIUMOO_SRC = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAASCAYAAAAdZl26AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo3NjI2Q0E2RkY0NDUxMUUxQkJFNTlGRUJBMERBOUI2NCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo3NjI2Q0E3MEY0NDUxMUUxQkJFNTlGRUJBMERBOUI2NCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjc2MjZDQTZERjQ0NTExRTFCQkU1OUZFQkEwREE5QjY0IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjc2MjZDQTZFRjQ0NTExRTFCQkU1OUZFQkEwREE5QjY0Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Sm54igAABClJREFUeNrUV01sG1UQ/tZZO3FSr+3Fjp0/t4lKSFpUUJo0BQ5wAC5cqlaqemjFCY7AoYUTXDgAhQMSEick1KIKJOACSEhUQkKlSVrSQJqA0woa3MT5cVK7teO/2N5l5sV27WXtWuEQMdLzPs/O8843883MWv7oh0kbgPdpnaSl4v8hMVqf0Toj08dZWq+w9m5Ow4bGO4mWXrSVDGe39LtI7bJZdgqAu+hzmgGcYs2lexquhpaRv/ErZC0PSZL+fYx81+ijYJEh9x/E8B4fnnZadjITLzEANbpJzv95G7lz7+LZpw7D6XTUPZXOJHHx/DuYPHka+/Z1w9tcG8TR4X78EV7H3HIUj/d40a0q+G76r8bC3NqMFqsMn9KKZqssdFduLVeaqEKb4sjOjOPEkRfw9ltvNPTjn3x6AR+MTyAxcAxek/t2emA6l4fDTk7ITULX53Mjkc6a2h4/PFj+PkeAs3T20N4uZPMF3Imn6Jqv+t2SyCWe62TgcjprOhxZjWAxvIihoaGt6LgV6LmcqS1H+rE9fpy7NFMVTY+jFZu5Ap7bv7usj6c3cXMlCkeLDV9fncOj3R4odhvWyMn5SAwXfw/VDWTDBG73tcNms22brMO9fixFE1iMxoXTj3R6xPX2nXjZJlMR2VpiL1LJkAFzmZ2dhaaJtgRFUbbtPPO3t90t6HDt7xWhG+jylPnM2TETPvOiWv3cJQpAZVZqAggGgwgEAmXHF0ILiEQi2wNANTAdWkWX6kDgIUXw26wWjMIUmpxfQb9fFbTifYYo2FAGCoVCVdR7dvdgdW212kiq70CHs63I8yx+W1jDKO0ZBNdBmOhklJYKepS6TiyVFYBBAHjfcA0wAKNYrVazmWZKGS7KZwYDIvoluU4guJA7CQQXrlGeP9AnaMPiJTuukQdJTQB+v1/UAA80XdcxNjaGwYHBhijDznFH+XwiKHh/P8JbYFhnpALLN9du0jwKC8cZZCSefOCz5FIopaYmJFOp8g2fzwe73Y6pqSlYLBaMjIxUZWAjmRJnTF9URKqr0z3QoWKU+vpSkTrc96epoG+sxIT9hcuz4hpLrYk2u55IYX493hiAQnID8oEn8cX596ARdZwmHefHnybuT+J0Bl99+z2sx19DYYMcsrvqPoSnL0eUC7nUeUb7OsSgylA2eEqX+N3rUQSNvrwSbCjbEr2N6tG7MXw8fh27OvciH/wFUiFfp0J16E30LrR/BIlwCC8ffBg+r7du3+bJaZygZlO1cuhVFmypGSzfS5pmIKq63Oohh4zLM2Noae+Gta2NaGMOQNN0bFLGElM/44nejrrOi2wVHTRzNF1jcBm7jZnjRYlyBj6kzav8bT0ep8MZ6FS4Uo0Ow/eoquGmLuN1OXf6f8FZzsDrRb6c8iiK2/MfJu4O/KF58x8BBgBA57HK0HJb5wAAAABJRU5ErkJggg=="
PLAYDIUMOO_GRAY_SRC = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAASCAYAAAAdZl26AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo3NjI2Q0E3M0Y0NDUxMUUxQkJFNTlGRUJBMERBOUI2NCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo3NjI2Q0E3NEY0NDUxMUUxQkJFNTlGRUJBMERBOUI2NCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjc2MjZDQTcxRjQ0NTExRTFCQkU1OUZFQkEwREE5QjY0IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjc2MjZDQTcyRjQ0NTExRTFCQkU1OUZFQkEwREE5QjY0Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+VqXRZwAABEZJREFUeNrUV21v21QUPn6JEzvvcRLSpenWZmQI2KqB2IRgSEjwBTEhISR+2H4IIL7BeBtQbYwI6LRB38iaNGmXtHFSJ36JHXv3uMmaubEb+FI4ypV9b861n+fc55x7Td366lcGAN4j7TJpPPw/TCNtlbTb7Aj8NRztGhav2BACoEjPHvlSrrlH4wIFejxAK2dEIDTCbLKjyMMfPatYa3fmh43HFGMNCW7q5DQbfzZYNAPM3JKdF+ONqxFq4wxX4ioS4CXDCteaBwXzh8/hyqUXgRf8lWQYOqze+Yyq37iZL3Cp3TRH97x83ynNL9clubHV6rZemkvNpcKh5Mpm49Es6BJ8kOcCDEvmRAI0HcCxB/X96oQLzzqCsoGzquvw1huvwaeffDQT9W+++wm+3NgANXc9SLonCITIizVjaAYDTCjAMs57slEhqxmmOs33Rmn+9XF/r9PfNSzLuJCOF4fk2tcN2Rxa5uRzx77sM50T2QiC4Am42+3CQbsNS4uLTj8SIatkDqf6YqQLqejC1w+3701GUwgGoiYBdG0xVxqPqwNTq7XlFsey/P3KbvmCGJvjOTZkaAOj3VObv1T21v0CSc8qtng8DizL/muxlnLJwqGqt9t9TULQmVj4HF6fyIo09hlMRNYzewPMcyB8EVVrNbAt60hsPqtzmqF+UxE+i3LYbHZqOJZLhNWxnnF1ps3DOe+/cj75nBIUXZpcFU8CO/U6pMU0kdXRs/dbB3BIZASFwj8nwNJsvS1XkySBX4gKSdS3bgy10+ahhNb3pBqRYwZlhfeaaRozScgikRcmqlE6IwLPuwJF+QPIxoQoXpWB6URbIvJBEliJ8N7tz03IY1x1OqquIuHxveaSmS8BtzHuHLC9JYNJ+Wo+XWJGQNA2mlIDEznGB1OYuO55y4XMyygbvI/yXARz5LRV8iSQSCScHHBw2jasra3B/Ln8TJJBcFhRvv2zWh6OouckIMs6ZHDMLQW0+3/vrT7e724hcCTZUTT5tHexz0JJ06AP9GMCpOpwAQ4qlQpQ5L9i8SKpQszxYUTTnTnTDJcaXNW+mIlnlrKJJaxE2Me6T4hWCeAW+v+8vnMPr9iwzCqk9teknjQTAUtVgFm4BCt3vnCqjsCfrDgPHx2fGAaDAdwt/w7smx/AUCF7WCjm+xLUPEYUE3lceS7n0wu4URnm0MRd2iFNrJCMJFFGdzcb5VlW2yEggKnp3ZYdevdjaqW+BVS745Oh5DSEZ6G3PwS1vQ/hmOir0x/Xd8qYeO4dFIlgTriTEqMua0Z5TMipRn2th82LgJqMJyBPb1e3q2sLXFykmGBo6lnuKB/IBqxroFb+gkKMr2XEUt/33DsCqE3ZpDSPjWsSPFrzUPHKBRUJPMCj6fXl5cpFWX4iawPeRvQeFcZhZkcgdj6nifFY/4y/C35DArdHnStiNApiFBT479v4g+b7pwIMAJmhJMTN+GtYAAAAAElFTkSuQmCC"

getLink= (type, id) ->
  "#{SCHEME}://#{type}?key=#{id}"

musicianLinkTemplate = (musician_id) ->
  "<a class='diumoo-link' href=#{getLink "musician", musician_id}>diumoo</a>"

musicianButtonTemplate = (musician_id) ->
  "<a class='diumoo_button' id='diumoo_musician_button' title='去diumoo收听'" +
  "href=#{getLink "musician", musician_id}>" +
  "</a>"

albumButtonTemplate = (album_id) ->
    "<a class='diumoo_button album'   title='去diumoo收听'" +
    "href=#{getLink "album", album_id}>" +
    "</a>"


soundtrackLinkTemplate = (movie_id)->
  "<br><a href=#{getLink "soundtrack", movie_id}>去diumoo收听</a>"

albumLinkTemplate = (album_id)->
    "<a class='diumoo-link' href=#{getLink "album", album_id}>diumoo</a>"

albumTemplate = (album_id, album_name)->
  "<div class='infobox''>" +
  "<div class='ex1'><span></span></div>" +
  "<div class='bd'>" +
  "<div id='diumoo-notification'>" +
  "<p>去diumoo收听 「<a href=#{getLink "album", album_id}>#{album_name}</a>」<p>" +
  "</div></div>" +
  "<div class='ex2'><span></span></div></div>"

buttonTemplate = (album_id)->
  "<a class='diumoo-icon' href='#{getLink "album", album_id}'>" +
  "<img src='#{ICON_SRC}'/>"+
  "</a>"




class Application
  constructor: ->
    @host = window.location.host
    @url = window.location.href
    @junks = @url.split('/')

    @type = @getType()
    # console.log @type
    return unless @type?

    switch @type
      when 'subject'
        # @injectButtonView('#db-rec-section dd')
        @injectSubjectView()
      # when 'site'     then @injectButtonView '.music-list li'
      # when 'mine'     then @injectButtonView 'div.album-title'
      # when 'people'   then @injectButtonView '.info li.title'
      when "tag", "search", "recommended"
        @injectButtonView 'div.pl2 a.start_radio', '.item'
        @injectMusicianButtonView()
      # when "home"     then @injectButtonView '#music_rec dt'
      when "doulist"
        @injectButtonView 'div.pl2 a.start_radio', '.doulist_item'
      when 'musician'
        # @injectButtonView '#best_albums div.info'
        @injectMusicianView()
      when 'movie'
        @injectSoundtrackView()

    $icon = $('a.diumoo-icon')
    $icon.hover -> $(@).css 'background', 'white'
    $icon.css('margin-left', '3px').find("img").css('width', '14px')
    $('a.diumoo-link').css "margin-left": "6px"

  getType: ->
    host = @host.split('.')[0]
    if host in ["site", "movie"]
      return host

    first_path = @junks[3]

    if first_path in ['subject', 'tag', 'musician', 'people', 'doulist']
      return first_path
      # when "subject"  then return "subject"
      # when "doulist"  then return "doulist" if junks[5] is "" or junks[5][0] is '?'
      # when "tag"      then return "tag"
      # when "musician" then return "musician"
      # when "mine"     then return "mine"

    if @url is "http://music.douban.com/"
      "home"
    else if first_path[0..3] is "mine"
      "mine"
    else if first_path[0..13] is "subject_search" or first_path is "search"
      "search"
    else if first_path[0..11] is "recommended"
      "recommended"



  injectSubjectView: ->
    return if $('.olts').length is 0
    album_id = @junks[4]

    start_radio_button = $('.start_radio')
    if start_radio_button.length isnt 0
      start_radio_button.find('a').after albumLinkTemplate(album_id)
    else
      album_name = $('h1 span').text()
      album_html = albumTemplate(album_id, album_name)
      # $('.aside').prepend(album_html)

    $album_view = $('#diumoo-notification');
    $album_view.css
      "margin": "0"
      "padding": "0"
    $album_view.find('p').css
      "line-height": "2.2em"
      "margin": "0"

  injectMusicianView: ->
    $musician_link = $('.start_radio')
    return if $musician_link.length is 0

    musician_id = @junks[4]
    musician_html = musicianLinkTemplate(musician_id)
    $musician_link.find('a').after(musician_html).css "margin-right", "3px"

  injectMusicianButtonView: ->

    if @type is 'search'
      $musician_block = $('div.content.musician')
      $musician_radio_link = $musician_block.find('a.start_radio_musician')
      return if $musician_radio_link.length is 0
      musician_id = $musician_block.find('.ll.musician_title').attr("href").split("/")[4]
      hover_selector = '.result-item.musician'
      css_object =
        "display": "inline-block"
        "width": "48px"
        "height": "18px"
        "margin-top": "4px"
        "margin-left": "16px"
        "margin-bottom": "0px"
        "background": "url(#{PLAYDIUMOO_GRAY_SRC})"

    else if @type is 'tag'
      $musician_block = $('#musician_info')
      return if $musician_block.length is 0
      $musician_radio_link = $musician_block.find('em')
      musician_id = $musician_block.find('a').eq(0).attr("href").split("/")[4]
      hover_selector = '#musician_info'
      css_object =
        "display": "inline-block"
        "width": "48px"
        "height": "18px"
        "margin-left": "8px"
        "margin-bottom": "-5px"
        "background": "url(#{PLAYDIUMOO_GRAY_SRC}) no-repeat"




    musician_button_html = musicianButtonTemplate(musician_id)

    $musician_radio_link.after(musician_button_html)

    button = $("#diumoo_musician_button")
    button
      .css css_object




    oMusician = $(hover_selector);
    oMusician.hover(
      -> button.css("background", "url(#{PLAYDIUMOO_SRC})"),
      -> button.css("background", "url(#{PLAYDIUMOO_GRAY_SRC})")
    ) if oMusician.length



  injectSoundtrackView: ->
    fm_link = $('.aside a[href^="http://douban.fm"]')
    return if fm_link.length is 0
    movie_id = @junks[4]
    soundtrack_html = soundtrackLinkTemplate(movie_id)
    fm_link.after(soundtrack_html).css "margin-top", "2px"

  injectButton: ->
    $item = $(@)
    album_id = $item.parent().find('a')[0].href.split('/')[4]
    album_button_html = albumButtonTemplate(album_id)
    $item.after album_button_html

  injectButtonView: (selector, hover_selector)->
    $(selector).each @injectButton
    $album_buttons = $(".diumoo_button.album")
    $album_buttons
      .css
        "display": "inline-block"
        "width": "48px"
        "height": "18px"
        "margin-left": "16px"
        "margin-bottom": "-4px"
        "padding": "0"
        "background": "url(#{PLAYDIUMOO_GRAY_SRC})"

      $(hover_selector).hover(
        -> $(@).find('.diumoo_button').css "background", "url(#{PLAYDIUMOO_SRC})"
        -> $(@).find('.diumoo_button').css "background", "url(#{PLAYDIUMOO_GRAY_SRC})"
      )

app = new Application()
