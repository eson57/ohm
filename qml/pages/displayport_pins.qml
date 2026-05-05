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
            title: qsTr("Main link lane 0 (+)")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 2")
            col: qsTr("")
            title: qsTr("Ground")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 3")
            col: qsTr("")
            title: qsTr("Main link lane 0 (−)")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 4")
            col: qsTr("")
            title: qsTr("Main link lane 1 (+)")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 5")
            col: qsTr("")
            title: qsTr("Ground")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 6")
            col: qsTr("")
            title: qsTr("Main link lane 1 (-)")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 7")
            col: qsTr("")
            title: qsTr("Main link lane 2 (+)")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 8")
            col: qsTr("")
            title: qsTr("Ground")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 9")
            col: qsTr("")
            title: qsTr("Main link lane 2 (-)")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 10")
            col: qsTr("")
            title: qsTr("Main link lane 3 (+)")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 11")
            col: qsTr("")
            title: qsTr("Ground")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 12")
            col: qsTr("")
            title: qsTr("Main link lane 3 (-)")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 13")
            col: qsTr("")
            title: qsTr("Cable adaptor detect")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 14")
            col: qsTr("")
            title: qsTr("CEC")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 15")
            col: qsTr("")
            title: qsTr("Auxiliary channel (+)")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 16")
            col: qsTr("")
            title: qsTr("Ground")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 17")
            col: qsTr("")
            title: qsTr("Auxiliary channel (−)")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 18")
            col: qsTr("")
            title: qsTr("Hot plug detect")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 19")
            col: qsTr("")
            title: qsTr("Return for power")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 20")
            col: qsTr("")
            title: qsTr("Power (3.3 V 500 mA)")
            description: qsTr("")
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height
        PageHeader {
            id: pagehead
            title: qsTr("DisplayPort pin assignments")
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
                source: "../img/displayport_female.png"
                color: Theme.primaryColor
                width: parent.width
                // width: 450 * resScale
                // height: 300 * resScale
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
