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
            col: qsTr("HDMI 1.0–2.0")
            title: qsTr("TMDS data 2 (+) Data0+")
            description: qsTr("HDMI 2.1+: FRL data 2 (+)")
        }
        ListElement {
            pin: qsTr("PIN 2")
            col: qsTr("HDMI 1.0–2.0")
            title: qsTr("TMDS data 2 ground")
            description: qsTr("HDMI 2.1+: FRL data 2 ground")
        }
        ListElement {
            pin: qsTr("PIN 3")
            col: qsTr("HDMI 1.0–2.0")
            title: qsTr("TMDS data 2 (−)")
            description: qsTr("HDMI 2.1+: FRL data 2 (−)")
        }
        ListElement {
            pin: qsTr("PIN 4")
            col: qsTr("HDMI 1.0–2.0")
            title: qsTr("TMDS data 1 (+)")
            description: qsTr("HDMI 2.1+: FRL data 1 (+)")
        }
        ListElement {
            pin: qsTr("PIN 5")
            col: qsTr("HDMI 1.0–2.0")
            title: qsTr("MDS data 1 ground")
            description: qsTr("HDMI 2.1+: FRL data 1 ground")
        }
        ListElement {
            pin: qsTr("PIN 6")
            col: qsTr("HDMI 1.0–2.0")
            title: qsTr("TMDS data 1 (−)")
            description: qsTr("HDMI 2.1+: FRL data 1 (−)")
        }
        ListElement {
            pin: qsTr("PIN 7")
            col: qsTr("HDMI 1.0–2.0")
            title: qsTr("TMDS data 0 (+)")
            description: qsTr("HDMI 2.1+: FRL data 0 (+)")
        }
        ListElement {
            pin: qsTr("PIN 8")
            col: qsTr("HDMI 1.0–2.0")
            title: qsTr("TMDS data 0 ground")
            description: qsTr("HDMI 2.1+: FRL data 0 ground")
        }
        ListElement {
            pin: qsTr("PIN 9")
            col: qsTr("HDMI 1.0–2.0")
            title: qsTr("TMDS data 0 (−)")
            description: qsTr("HDMI 2.1+: FRL data 0 (−)")
        }
        ListElement {
            pin: qsTr("PIN 10")
            col: qsTr("HDMI 1.0–2.0")
            title: qsTr("TMDS clock (+)")
            description: qsTr("HDMI 2.1+: FRL clock (+)")
        }
        ListElement {
            pin: qsTr("PIN 11")
            col: qsTr("HDMI 1.0–2.0")
            title: qsTr("TMDS clock ground")
            description: qsTr("HDMI 2.1+: FRL clock ground")
        }
        ListElement {
            pin: qsTr("PIN 12")
            col: qsTr("HDMI 1.0–2.0")
            title: qsTr("TMDS clock (−)")
            description: qsTr("HDMI 2.1+: FRL clock (−)")
        }
        ListElement {
            pin: qsTr("PIN 13")
            col: qsTr("HDMI")
            title: qsTr("CEC")
            description: qsTr("Consumer Electronics Control")
        }
        ListElement {
            pin: qsTr("PIN 14")
            col: qsTr("HDMI 1.4–2.0")
            title: qsTr("ARC (+) or HEC (+)")
            description: qsTr("HDMI 2.1+: eARC (+), ARC (+) or HEC (+)")
        }
        ListElement {
            pin: qsTr("PIN 15")
            col: qsTr("HDMI")
            title: qsTr("SCL Clock")
            description: qsTr("for DDC")
        }
        ListElement {
            pin: qsTr("PIN 16")
            col: qsTr("HDMI")
            title: qsTr("SDA data")
            description: qsTr("for DDC")
        }
        ListElement {
            pin: qsTr("PIN 17")
            col: qsTr("HDMI")
            title: qsTr("Ground for ARC, eARC, CEC, DDC and HEC")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 18")
            col: qsTr("HDMI")
            title: qsTr("+5 V (up to 50 mA)")
            description: qsTr("")
        }
        ListElement {
            pin: qsTr("PIN 19")
            col: qsTr("HDMI")
            title: qsTr("Hot plug detect")
            description: qsTr("eARC (−), ARC (−) or HEC (−)")
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height
        PageHeader {
            id: pagehead
            title: qsTr("HDMI pin assignments")
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
                source: "../img/hdmi_female.png"
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
