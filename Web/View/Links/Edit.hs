module Web.View.Links.Edit where
import Web.View.Prelude

data EditView = EditView { link :: Link }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={LinksAction}>Links</a></li>
                <li class="breadcrumb-item active">Edit Link</li>
            </ol>
        </nav>
        <h1>Edit Link</h1>
        {renderForm link}
    |]

renderForm :: Link -> Html
renderForm link = formFor link [hsx|
    {(textField #url)}
    {(textField #visits)}
    {submitButton}
|]
