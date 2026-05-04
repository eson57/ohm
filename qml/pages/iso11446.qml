import QtQuick 2.6
import Sailfish.Silica 1.0
import "components/"

Page {
    id: page
    property int resScale: mainapp.smallScreen ? 1 : mainapp.mediumScreen ? 2 : 2
    ListModel {
        id: pagesModel

        ListElement {
            pin: qsTr("PIN 1")
            col: qsTr("Yellow")
            title: qsTr("Left indicator")
            description: qsTr("Sometimes black/white")
        }
        ListElement {
            pin: qsTr("PIN 2")
            col: qsTr("Blue")
            title: qsTr("Rear fog lamp")
            description: qsTr("Sometimes black/blue")
        }
        ListElement {
            pin: qsTr("PIN 3")
            col: qsTr("White")
            title: qsTr("Ground for pin 1-8")
            description: qsTr("Sometimes brown")
        }
        ListElement {
            pin: qsTr("PIN 4")
            col: qsTr("Green")
            title: qsTr("Right indicator")
            description: qsTr("Sometimes black/green")
        }
        ListElement {
            pin: qsTr("PIN 5")
            col: qsTr("Brown")
            title: qsTr("Right tail lamp")
            description: qsTr("Sometimes grey/red")
        }
        ListElement {
            pin: qsTr("PIN 6")
            col: qsTr("Red")
            title: qsTr("Brake lamp")
            description: qsTr("Sometimes black/red")
        }
        ListElement {
            pin: qsTr("PIN 7")
            col: qsTr("Black")
            title: qsTr("Left tail lamp")
            description: qsTr("Sometimes grey/black")
        }
        ListElement {
            pin: qsTr("PIN 8")
            col: qsTr("Grey")
            title: qsTr("Reverse lamp")
            description: qsTr("Sometimes black/blue")
        }
        ListElement {
            pin: qsTr("PIN 9")
            col: qsTr("Brown/Blue")
            title: qsTr("Permanent power (+12V)")
            description: qsTr("Sometimes orange or red")

        }
        ListElement {
            pin: qsTr("PIN 10")
            col: qsTr("Yellow/Red")
            title: qsTr("Switched supply (for fridge)")
            description: qsTr("Sometimes black/red for darkgrey")
        }
        ListElement {
            pin: qsTr("PIN 11")
            col: qsTr("White/Black")
            title: qsTr("Ground for pin 10")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 12")
            col: qsTr("Undefined")
            title: qsTr("Trailer Presence Detection")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 13")
            col: qsTr("White/Red")
            title: qsTr("Ground for pin 9")
            description: qsTr("")
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height
        PageHeader {
            id: pagehead
            title: qsTr("ISO 11446 car trailer pin assignments")
        }

        Column {
            id: column
            width: page.width
            anchors {
                top: pagehead.bottom
            }

            SectionHeader {
                text: qsTr("Female connector")
                visible: isPortrait
            }

            HighlightImage {
                id: img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/ISO11446.png"
                color: Theme.primaryColor
                width: 400 * resScale
                height: 250 * resScale
            }

            Separator {
                id: effect
                color: Theme.primaryColor
                width: page.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Qt.AlignHCenter
            }

            VerticalScrollDecorator {}

            TextMetrics {
                id: textMetrics
                text: pagesModel.get(pagesModel.count - 1).pin
                font.pixelSize: Theme.fontSizeExtraSmall
                font.family: Theme.fontFamily
            }

            PinsDetails {
                model: pagesModel
                pinTextMaxWidth: textMetrics.width
            }
        }
    }
}
