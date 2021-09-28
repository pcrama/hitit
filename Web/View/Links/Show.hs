module Web.View.Links.Show where
import Web.View.Prelude

data ShowView = ShowView { link :: Link }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={LinksAction}>Links</a></li>
                <li class="breadcrumb-item active">Show Link</li>
            </ol>
        </nav>
        <h1>Show Link</h1>
        <p>{link}</p>
    |]
