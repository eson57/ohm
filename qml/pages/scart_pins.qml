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
            col: qsTr("")
            title: qsTr("Audio Output (R)")
            description: qsTr("Audio Output right 0.5V / 1K-ohm")
        }
        ListElement {
            pin: qsTr("PIN 2")
            col: qsTr("Cyan")
            title: qsTr("Audio Input (R)")
            description: qsTr("Audio Input right 0.5V / 10K-ohm")
        }
        ListElement {
            pin: qsTr("PIN 3")
            col: qsTr("")
            title: qsTr("Audio Output (L)")
            description: qsTr("Audio Output left 0.5V / 1K-ohm")
        }
        ListElement {
            pin: qsTr("PIN 4")
            col: qsTr("Black")
            title: qsTr("Audio Ground")
            description: qsTr("pins 1, 2, 3 & 6 ground")
        }
        ListElement {
            pin: qsTr("PIN 5")
            col: qsTr("Black")
            title: qsTr("Blue Ground")
            description: qsTr("pin 7 ground")
        }
        ListElement {
            pin: qsTr("PIN 6")
            col: qsTr("Pink")
            title: qsTr("Audio Input (L)")
            description: qsTr("Audio Input left 0.5V / 10K-ohm")
        }
        ListElement {
            pin: qsTr("PIN 7")
            col: qsTr("Blue")
            title: qsTr("Blue")
            description: qsTr("Blue color")
        }
        ListElement {
            pin: qsTr("PIN 8")
            col: qsTr("Yellow")
            title: qsTr("Status & Aspect Ratio up")
            description: qsTr("L:0-2V H:10 - 12V / 10K-ohm")
        }
        ListElement {
            pin: qsTr("PIN 9")
            col: qsTr("Black")
            title: qsTr("Green ground")
            description: qsTr("Green ground")
        }
        ListElement {
            pin: qsTr("PIN 10")
            col: qsTr("")
            title: qsTr("Data D2B (Inverted)")
            description: qsTr("Clock/Data 2 Control bus (AV.link)")
        }
        ListElement {
            pin: qsTr("PIN 11")
            col: qsTr("Green")
            title: qsTr("Green")
            description: qsTr("Component Y, 0.7Vp-p / 75 ohm")
        }
        ListElement {
            pin: qsTr("PIN 12")
            col: qsTr("")
            title: qsTr("Data D2B")
            description: qsTr("Reserved / Data 1")
        }
        ListElement {
            pin: qsTr("PIN 13")
            col: qsTr("Black")
            title: qsTr("Red ground")
            description: qsTr("pin 15 ground")
        }
        ListElement {
            pin: qsTr("PIN 14")
            col: qsTr("")
            title: qsTr("D2B Ground")
            description: qsTr("pins 8, 10 & 12 ground")
        }
        ListElement {
            pin: qsTr("PIN 15")
            col: qsTr("Red")
            title: qsTr("Red")
            description: qsTr("S-Video C/Component PR")
        }
        ListElement {
            pin: qsTr("PIN 16")
            col: qsTr("Orange")
            title: qsTr("RGB Status/Fast Blanking")
            description: qsTr("L:0-0.4V H:1-3V / 75 ohm")
        }
        ListElement {
            pin: qsTr("PIN 17")
            col: qsTr("Black")
            title: qsTr("CVBS Video Ground")
            description: qsTr("Composite video ground (pin 19 & 20 ground)")
        }
        ListElement {
            pin: qsTr("PIN 18")
            col: qsTr("Black")
            title: qsTr("RGB Status Ground")
            description: qsTr("Blanking signal ground (pin 16 ground)")
        }
        ListElement {
            pin: qsTr("PIN 19")
            col: qsTr("")
            title: qsTr("Composite Video Output")
            description: qsTr("S-Video Y output, 1V / 75 ohm")
        }
        ListElement {
            pin: qsTr("PIN 20")
            col: qsTr("Grey")
            title: qsTr("Composite Video Input")
            description: qsTr("S-Video Y input, 1V / 75 ohm")
        }
        ListElement {
            pin: qsTr("PIN 21")
            col: qsTr("Black")
            title: qsTr("Case Shield")
            description: qsTr("Common ground")
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height
        PageHeader {
            id: pagehead
            title: qsTr("SCART/EXT/EuroAV pin assignments")
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
                source: "../img/scart_female.png"
                color: Theme.primaryColor
                width: 450 * resScale
                height: 300 * resScale
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
