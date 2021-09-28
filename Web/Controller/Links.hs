module Web.Controller.Links where

import Web.Controller.Prelude
import Web.View.Links.Index
import Web.View.Links.New
import Web.View.Links.Edit
import Web.View.Links.Show

instance Controller LinksController where
    action LinksAction = do
        links <- query @Link |> fetch
        render IndexView { .. }

    action NewLinkAction = do
        let link = newRecord
        render NewView { .. }

    action ShowLinkAction { linkId } = do
        link <- fetch linkId
        render ShowView { .. }

    action EditLinkAction { linkId } = do
        link <- fetch linkId
        render EditView { .. }

    action UpdateLinkAction { linkId } = do
        link <- fetch linkId
        link
            |> buildLink
            |> ifValid \case
                Left link -> render EditView { .. }
                Right link -> do
                    link <- link |> updateRecord
                    setSuccessMessage "Link updated"
                    redirectTo EditLinkAction { .. }

    action CreateLinkAction = do
        let link = newRecord @Link
        link
            |> buildLink
            |> ifValid \case
                Left link -> render NewView { .. } 
                Right link -> do
                    link <- link |> createRecord
                    setSuccessMessage "Link created"
                    redirectTo LinksAction

    action DeleteLinkAction { linkId } = do
        link <- fetch linkId
        deleteRecord link
        setSuccessMessage "Link deleted"
        redirectTo LinksAction

buildLink link = link
    |> fill @["url","visits"]
