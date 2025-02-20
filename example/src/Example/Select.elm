module Example.Select exposing (Model, Msg, init, subscriptions, update, view)

import Browser
import Element exposing (Element)
import Widget exposing (ButtonStyle, RowStyle)
import Widget.Material as Material


type alias Style style msg =
    { style
        | buttonRow : RowStyle msg
        , selectButton : ButtonStyle msg
    }


materialStyle : Style {} msg
materialStyle =
    { buttonRow = Material.buttonRow
    , selectButton = Material.toggleButton Material.defaultPalette
    }


type Model
    = Selected (Maybe Int)


type Msg
    = ChangedSelected Int


init : ( Model, Cmd Msg )
init =
    ( Selected Nothing
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg _ =
    case msg of
        ChangedSelected int ->
            ( Selected <| Just int
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


{-| You can remove the msgMapper. But by doing so, make sure to also change `msg` to `Msg` in the line below.
-}
view : (Msg -> msg) -> Style style msg -> Model -> Element msg
view msgMapper style (Selected selected) =
    { selected = selected
    , options =
        [ 1, 2, 42 ]
            |> List.map
                (\int ->
                    { text = String.fromInt int
                    , icon = always Element.none
                    }
                )
    , onSelect = ChangedSelected >> msgMapper >> Just
    }
        |> Widget.select
        |> Widget.buttonRow
            { elementRow = style.buttonRow
            , content = style.selectButton
            }


main : Program () Model Msg
main =
    Browser.element
        { init = always init
        , view = \model -> model |> view identity materialStyle |> Element.layout []
        , update = update
        , subscriptions = subscriptions
        }
