module Web.View.Links.Index where
import Web.View.Prelude

data IndexView = IndexView { links :: [Link] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={LinksAction}>Links</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewLinkAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Link</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach links renderLink}</tbody>
            </table>
        </div>
    |]


renderLink :: Link -> Html
renderLink link = [hsx|
    <tr>
        <td><a href={get #url link}>{get #url link}</a> {visited link}</td>
        <td><a href={ShowLinkAction (get #id link)}>Show</a></td>
        <td><a href={EditLinkAction (get #id link)} class="text-muted">Edit</a></td>
        <td><a href={DeleteLinkAction (get #id link)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
  where visited (Link { visits = 0 }) = "never visited"
        visited (Link { visits = 1 } ) = "visited once"
        visited (Link { visits } ) = "visited " <> show visits <> " times"
