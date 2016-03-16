window.Admin =
editor:() ->
  new Simditor(
    textarea: $('#editor')
    toolbar: ['title','bold','italic','underline','strikethrough','color','|','ol','ul','blockquote','code','table','|','link','image','emoji','hr', '|', 'html', 'markdown', '|', 'fullscreen']
    markdown: false
    emoji: {
      imagePath: '/images/simditor-emoji/'
    }
    placeholder: '请输入正文...'
    defaultImage: '/image.png'
    filekey: 'file'
    upload: {
      url: '/photo',
      params: null,
      connectionCount: 3,
      leaveConfirm: '正在上传文件，如果离开上传会自动取消',
    }
    pasteImage: true
  )
