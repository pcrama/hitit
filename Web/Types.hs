module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data LinksController
    = LinksAction
    | NewLinkAction
    | ShowLinkAction { linkId :: !(Id Link) }
    | CreateLinkAction
    | EditLinkAction { linkId :: !(Id Link) }
    | UpdateLinkAction { linkId :: !(Id Link) }
    | DeleteLinkAction { linkId :: !(Id Link) }
    deriving (Eq, Show, Data)
