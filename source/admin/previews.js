const BlogPreview = ({ entry, widgetFor }) => {
    const data = entry.get('data').toJS()
    const date = dayjs(data.date).format('DD-MM-YY')
    return (
        <div className="news-detail">
            <div className="container">
                <div className="row">
                    <div className="title">
                        <span className="date">{date}</span>
                        <h1>{data.title}</h1>
                    </div>
                </div>
                <div className="row">
                    <div className="image">
                        <img src={data.image}/>
                    </div>
                </div>
                <div className="row content">{widgetFor('body')}</div>
            </div>
        </div>
    )
}

CMS.registerPreviewTemplate('blog', BlogPreview)

CMS.registerPreviewStyle('/stylesheets/all.css')