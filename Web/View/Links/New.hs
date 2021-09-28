module Web.View.Links.New where
import Web.View.Prelude

data NewView = NewView { link :: Link }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={LinksAction}>Links</a></li>
                <li class="breadcrumb-item active">New Link</li>
            </ol>
        </nav>
        <h1>New Link</h1>
        {renderForm link}
    |]

renderForm :: Link -> Html
renderForm link = formFor link [hsx|
    {(textField #url)}
    {(textField #visits)}
    {submitButton}
|]
