module Data.Example exposing (Example, Model, Msg, asList, fromString, init, subscriptions, toCardList, toString, update, view)

import Data.Style exposing (Style)
import Element exposing (Element)
import Example.AppBar as AppBar
import Example.Button as Button
import Example.Dialog as Dialog
import Example.Icon as Icon
import Example.Layout as Layout
import Example.List as List
import Example.Modal as Modal
import Example.MultiSelect as MultiSelect
import Example.ProgressIndicator as ProgressIndicator
import Example.Select as Select
import Example.Sheet as Sheet
import Example.Snackbar as Snackbar
import Example.SortTable as SortTable
import Example.Switch as Switch
import Example.Tab as Tab
import Example.TextInput as TextInput
import Framework.Grid as Grid
import View.States as States


type Example
    = ButtonExample
    | SwitchExample
    | SelectExample
    | MultiSelectExample
    | TabExample
    | SortTableExample
    | ModalExample
    | DialogExample
    | TextInputExample
    | ListExample
    | ProgressIndicatorExample
    | IconExample
    | SheetExample
    | AppBarExample
    | LayoutExample
    | SnackbarExample


asList : List Example
asList =
    [ ButtonExample
    , SwitchExample
    , SelectExample
    , MultiSelectExample
    , TabExample
    , SortTableExample
    , ModalExample
    , DialogExample
    , TextInputExample
    , ListExample
    , ProgressIndicatorExample
    , IconExample
    , SheetExample
    , AppBarExample
    , LayoutExample
    , SnackbarExample
    ]
        |> List.sortBy toString


toString : Example -> String
toString example =
    case example of
        ButtonExample ->
            "Button"

        SwitchExample ->
            "Switch"

        SelectExample ->
            "Select"

        MultiSelectExample ->
            "Multi Select"

        TabExample ->
            "Tab"

        SortTableExample ->
            "SortTable"

        ModalExample ->
            "Modal"

        DialogExample ->
            "Dialog"

        TextInputExample ->
            "TextInput"

        ListExample ->
            "List"

        ProgressIndicatorExample ->
            "Progress Indicator"

        IconExample ->
            "Icon"

        SheetExample ->
            "Sheet"

        AppBarExample ->
            "App Bar"

        LayoutExample ->
            "Layout"

        SnackbarExample ->
            "Snackbar"


fromString : String -> Maybe Example
fromString string =
    case string of
        "Button" ->
            Just ButtonExample

        "Switch" ->
            Just SwitchExample

        "Select" ->
            Just SelectExample

        "Multi Select" ->
            Just MultiSelectExample

        "Tab" ->
            Just TabExample

        "SortTable" ->
            Just SortTableExample

        "Modal" ->
            Just ModalExample

        "Dialog" ->
            Just DialogExample

        "TextInput" ->
            Just TextInputExample

        "List" ->
            Just ListExample

        "Progress Indicator" ->
            Just ProgressIndicatorExample

        "Icon" ->
            Just IconExample

        "Sheet" ->
            Just SheetExample

        "App Bar" ->
            Just AppBarExample

        "Layout" ->
            Just LayoutExample

        "Snackbar" ->
            Just SnackbarExample

        _ ->
            Nothing


get : Example -> ExampleView msg -> Element msg
get example =
    case example of
        ButtonExample ->
            .button

        SwitchExample ->
            .switch

        SelectExample ->
            .select

        MultiSelectExample ->
            .multiSelect

        TabExample ->
            .tab

        SortTableExample ->
            .sortTable

        ModalExample ->
            .modal

        DialogExample ->
            .dialog

        TextInputExample ->
            .textInput

        ListExample ->
            .list

        ProgressIndicatorExample ->
            .progressIndicator

        IconExample ->
            .icon

        SheetExample ->
            .sheet

        AppBarExample ->
            .appBar

        LayoutExample ->
            .layout

        SnackbarExample ->
            .snackbar


toTests : Example -> msg -> Style msg -> List ( String, Element msg )
toTests example =
    case example of
        ButtonExample ->
            States.button

        SwitchExample ->
            States.switch

        SelectExample ->
            States.select

        MultiSelectExample ->
            States.multiSelect

        TabExample ->
            States.tab

        SortTableExample ->
            States.sortTable

        ModalExample ->
            States.modal

        DialogExample ->
            States.dialog

        TextInputExample ->
            States.textInput

        ListExample ->
            States.list

        ProgressIndicatorExample ->
            States.progressIndicator

        IconExample ->
            States.icon

        SheetExample ->
            States.sheet

        AppBarExample ->
            States.appBar

        LayoutExample ->
            States.layout

        SnackbarExample ->
            States.snackbar


type Msg
    = Button Button.Msg
    | Switch Switch.Msg
    | Select Select.Msg
    | MultiSelect MultiSelect.Msg
    | Tab Tab.Msg
    | SortTable SortTable.Msg
    | Modal Modal.Msg
    | Dialog Dialog.Msg
    | TextInput TextInput.Msg
    | List List.Msg
    | ProgressIndicator ProgressIndicator.Msg
    | Icon Icon.Msg
    | Sheet Sheet.Msg
    | AppBar AppBar.Msg
    | Layout Layout.Msg
    | Snackbar Snackbar.Msg


type alias Model =
    { button : Button.Model
    , switch : Switch.Model
    , select : Select.Model
    , multiSelect : MultiSelect.Model
    , tab : Tab.Model
    , sortTable : SortTable.Model
    , modal : Modal.Model
    , dialog : Dialog.Model
    , textInput : TextInput.Model
    , list : List.Model
    , progressIndicator : ProgressIndicator.Model
    , icon : Icon.Model
    , sheet : Sheet.Model
    , appBar : AppBar.Model
    , layout : Layout.Model
    , snackbar : Snackbar.Model
    }


type alias UpgradeRecord model msg =
    { from : Model -> model
    , to : Model -> model -> Model
    , msgMapper : msg -> Msg
    , updateFun : msg -> model -> ( model, Cmd msg )
    , subscriptionsFun : model -> Sub msg
    }


type alias UpgradeCollection =
    { button : UpgradeRecord Button.Model Button.Msg
    , switch : UpgradeRecord Switch.Model Switch.Msg
    , select : UpgradeRecord Select.Model Select.Msg
    , multiSelect : UpgradeRecord MultiSelect.Model MultiSelect.Msg
    , tab : UpgradeRecord Tab.Model Tab.Msg
    , sortTable : UpgradeRecord SortTable.Model SortTable.Msg
    , modal : UpgradeRecord Modal.Model Modal.Msg
    , dialog : UpgradeRecord Dialog.Model Dialog.Msg
    , textInput : UpgradeRecord TextInput.Model TextInput.Msg
    , list : UpgradeRecord List.Model List.Msg
    , progressIndicator : UpgradeRecord ProgressIndicator.Model ProgressIndicator.Msg
    , icon : UpgradeRecord Icon.Model Icon.Msg
    , sheet : UpgradeRecord Sheet.Model Sheet.Msg
    , appBar : UpgradeRecord AppBar.Model AppBar.Msg
    , layout : UpgradeRecord Layout.Model Layout.Msg
    , snackbar : UpgradeRecord Snackbar.Model Snackbar.Msg
    }


type alias ExampleView msg =
    { button : Element msg
    , switch : Element msg
    , select : Element msg
    , multiSelect : Element msg
    , tab : Element msg
    , sortTable : Element msg
    , modal : Element msg
    , dialog : Element msg
    , textInput : Element msg
    , list : Element msg
    , progressIndicator : Element msg
    , icon : Element msg
    , sheet : Element msg
    , appBar : Element msg
    , layout : Element msg
    , snackbar : Element msg
    }


init : ( Model, Cmd Msg )
init =
    let
        ( buttonModel, buttonMsg ) =
            Button.init

        ( switchModel, switchMsg ) =
            Switch.init

        ( selectModel, selectMsg ) =
            Select.init

        ( multiSelectModel, multiSelectMsg ) =
            MultiSelect.init

        ( tabModel, tabMsg ) =
            Tab.init

        ( sortTableModel, sortTableMsg ) =
            SortTable.init

        ( modalModel, modalMsg ) =
            Modal.init

        ( dialogModel, dialogMsg ) =
            Dialog.init

        ( textInputModel, textInputMsg ) =
            TextInput.init

        ( listModel, listMsg ) =
            List.init

        ( progressIndicatorModel, progressIndicatorMsg ) =
            ProgressIndicator.init

        ( iconModel, iconMsg ) =
            Icon.init

        ( sheetModel, sheetMsg ) =
            Sheet.init

        ( appBarModel, appBarMsg ) =
            AppBar.init

        ( layoutModel, layoutMsg ) =
            Layout.init

        ( snackbarModel, snackbarMsg ) =
            Snackbar.init
    in
    ( { button = buttonModel
      , switch = switchModel
      , select = selectModel
      , multiSelect = multiSelectModel
      , tab = tabModel
      , sortTable = sortTableModel
      , modal = modalModel
      , dialog = dialogModel
      , textInput = textInputModel
      , list = listModel
      , progressIndicator = progressIndicatorModel
      , icon = iconModel
      , sheet = sheetModel
      , appBar = appBarModel
      , layout = layoutModel
      , snackbar = snackbarModel
      }
    , [ Cmd.map Button buttonMsg
      , Cmd.map Switch switchMsg
      , Cmd.map Select selectMsg
      , Cmd.map MultiSelect multiSelectMsg
      , Cmd.map Tab tabMsg
      , Cmd.map SortTable sortTableMsg
      , Cmd.map Modal modalMsg
      , Cmd.map Dialog dialogMsg
      , Cmd.map TextInput textInputMsg
      , Cmd.map List listMsg
      , Cmd.map ProgressIndicator progressIndicatorMsg
      , Cmd.map Icon iconMsg
      , Cmd.map Sheet sheetMsg
      , Cmd.map AppBar appBarMsg
      , Cmd.map Layout layoutMsg
      , Cmd.map Snackbar snackbarMsg
      ]
        |> Cmd.batch
    )


upgradeRecord : UpgradeCollection
upgradeRecord =
    { button =
        { from = .button
        , to = \model a -> { model | button = a }
        , msgMapper = Button
        , updateFun = Button.update
        , subscriptionsFun = Button.subscriptions
        }
    , switch =
        { from = .switch
        , to = \model a -> { model | switch = a }
        , msgMapper = Switch
        , updateFun = Switch.update
        , subscriptionsFun = Switch.subscriptions
        }
    , select =
        { from = .select
        , to = \model a -> { model | select = a }
        , msgMapper = Select
        , updateFun = Select.update
        , subscriptionsFun = Select.subscriptions
        }
    , multiSelect =
        { from = .multiSelect
        , to = \model a -> { model | multiSelect = a }
        , msgMapper = MultiSelect
        , updateFun = MultiSelect.update
        , subscriptionsFun = MultiSelect.subscriptions
        }
    , tab =
        { from = .tab
        , to = \model a -> { model | tab = a }
        , msgMapper = Tab
        , updateFun = Tab.update
        , subscriptionsFun = Tab.subscriptions
        }
    , sortTable =
        { from = .sortTable
        , to = \model a -> { model | sortTable = a }
        , msgMapper = SortTable
        , updateFun = SortTable.update
        , subscriptionsFun = SortTable.subscriptions
        }
    , modal =
        { from = .modal
        , to = \model a -> { model | modal = a }
        , msgMapper = Modal
        , updateFun = Modal.update
        , subscriptionsFun = Modal.subscriptions
        }
    , dialog =
        { from = .dialog
        , to = \model a -> { model | dialog = a }
        , msgMapper = Dialog
        , updateFun = Dialog.update
        , subscriptionsFun = Dialog.subscriptions
        }
    , textInput =
        { from = .textInput
        , to = \model a -> { model | textInput = a }
        , msgMapper = TextInput
        , updateFun = TextInput.update
        , subscriptionsFun = TextInput.subscriptions
        }
    , list =
        { from = .list
        , to = \model a -> { model | list = a }
        , msgMapper = List
        , updateFun = List.update
        , subscriptionsFun = List.subscriptions
        }
    , progressIndicator =
        { from = .progressIndicator
        , to = \model a -> { model | progressIndicator = a }
        , msgMapper = ProgressIndicator
        , updateFun = ProgressIndicator.update
        , subscriptionsFun = ProgressIndicator.subscriptions
        }
    , icon =
        { from = .icon
        , to = \model a -> { model | icon = a }
        , msgMapper = Icon
        , updateFun = Icon.update
        , subscriptionsFun = Icon.subscriptions
        }
    , sheet =
        { from = .sheet
        , to = \model a -> { model | sheet = a }
        , msgMapper = Sheet
        , updateFun = Sheet.update
        , subscriptionsFun = Sheet.subscriptions
        }
    , appBar =
        { from = .appBar
        , to = \model a -> { model | appBar = a }
        , msgMapper = AppBar
        , updateFun = AppBar.update
        , subscriptionsFun = AppBar.subscriptions
        }
    , layout =
        { from = .layout
        , to = \model a -> { model | layout = a }
        , msgMapper = Layout
        , updateFun = Layout.update
        , subscriptionsFun = Layout.subscriptions
        }
    , snackbar =
        { from = .snackbar
        , to = \model a -> { model | snackbar = a }
        , msgMapper = Snackbar
        , updateFun = Snackbar.update
        , subscriptionsFun = Snackbar.subscriptions
        }
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    (case msg of
        Button m ->
            updateField .button m

        Switch m ->
            updateField .switch m

        Select m ->
            updateField .select m

        MultiSelect m ->
            updateField .multiSelect m

        Tab m ->
            updateField .tab m

        SortTable m ->
            updateField .sortTable m

        Modal m ->
            updateField .modal m

        Dialog m ->
            updateField .dialog m

        TextInput m ->
            updateField .textInput m

        List m ->
            updateField .list m

        ProgressIndicator m ->
            updateField .progressIndicator m

        Icon m ->
            updateField .icon m

        Sheet m ->
            updateField .sheet m

        AppBar m ->
            updateField .appBar m

        Layout m ->
            updateField .layout m

        Snackbar m ->
            updateField .snackbar m
    )
        model


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        subFun { from, msgMapper, subscriptionsFun } =
            subscriptionsFun (from model) |> Sub.map msgMapper
    in
    [ upgradeRecord.button |> subFun
    , upgradeRecord.switch |> subFun
    , upgradeRecord.select |> subFun
    , upgradeRecord.multiSelect |> subFun
    , upgradeRecord.tab |> subFun
    , upgradeRecord.sortTable |> subFun
    , upgradeRecord.modal |> subFun
    , upgradeRecord.dialog |> subFun
    , upgradeRecord.textInput |> subFun
    , upgradeRecord.list |> subFun
    , upgradeRecord.progressIndicator |> subFun
    , upgradeRecord.icon |> subFun
    , upgradeRecord.sheet |> subFun
    , upgradeRecord.appBar |> subFun
    , upgradeRecord.layout |> subFun
    , upgradeRecord.snackbar |> subFun
    ]
        |> Sub.batch


view :
    (Msg -> msg)
    -> Style msg
    -> Model
    -> ExampleView msg
view msgMapper style model =
    { button =
        Button.view (Button >> msgMapper) style (.button model)
    , switch =
        Switch.view (Switch >> msgMapper) style (.switch model)
    , select =
        Select.view (Select >> msgMapper) style (.select model)
    , multiSelect =
        MultiSelect.view (MultiSelect >> msgMapper) style (.multiSelect model)
    , tab =
        Tab.view (Tab >> msgMapper) style (.tab model)
    , sortTable =
        SortTable.view (SortTable >> msgMapper) style (.sortTable model)
    , modal =
        Modal.view (Modal >> msgMapper) style (.modal model)
    , dialog =
        Dialog.view (Dialog >> msgMapper) style (.dialog model)
    , textInput =
        TextInput.view (TextInput >> msgMapper) style (.textInput model)
    , list =
        List.view (List >> msgMapper) style (.list model)
    , progressIndicator =
        ProgressIndicator.view (ProgressIndicator >> msgMapper) style (.progressIndicator model)
    , icon =
        Icon.view (Icon >> msgMapper) style (.icon model)
    , sheet =
        Sheet.view (Sheet >> msgMapper) style (.sheet model)
    , appBar =
        AppBar.view (AppBar >> msgMapper) style (.appBar model)
    , layout =
        Layout.view (Layout >> msgMapper) style (.layout model)
    , snackbar =
        Snackbar.view (Snackbar >> msgMapper) style (.snackbar model)
    }



--------------------------------------------------------------------------------
-- DO NOT CHANGE ANYTHING AFTER THIS
--------------------------------------------------------------------------------


toCardList :
    { idle : msg
    , msgMapper : Msg -> msg
    , style : Style msg
    , model : Model
    }
    -> List ( String, Element msg, List (Element msg) )
toCardList { idle, msgMapper, style, model } =
    asList
        |> List.map
            (\example ->
                { title = example |> toString
                , example = example |> get
                , test = example |> toTests
                }
            )
        |> List.map
            (\{ title, example, test } ->
                ( title
                , model
                    |> view msgMapper style
                    |> example
                , test idle style
                    |> List.map
                        (\( name, elem ) ->
                            Element.row Grid.spacedEvenly
                                [ name
                                    |> Element.text
                                    |> List.singleton
                                    |> Element.wrappedRow [ Element.width <| Element.shrink ]
                                , elem
                                    |> Element.el
                                        [ Element.paddingEach
                                            { top = 0
                                            , right = 0
                                            , bottom = 0
                                            , left = 8
                                            }
                                        , Element.width <| Element.shrink
                                        ]
                                ]
                        )
                )
            )


updateField :
    (UpgradeCollection -> UpgradeRecord model msg)
    -> msg
    -> Model
    -> ( Model, Cmd Msg )
updateField getter msg model =
    let
        { from, to, msgMapper, updateFun } =
            getter upgradeRecord
    in
    updateFun msg (from model)
        |> Tuple.mapBoth (to model) (Cmd.map msgMapper)
