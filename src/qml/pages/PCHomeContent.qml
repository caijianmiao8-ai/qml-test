import QtQuick 6.5
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "../components" as Components
import "../components/icons" as Icons

Item {
    id: root
    property var themeTokens
    property var t
    property string lang: "zh"
    property var devicesModel
    property string pairingHint: ""
    property int onlineDevicesCount: 0

    Components.ScrollArea {
        anchors.fill: parent
        themeTokens: root.themeTokens

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 32
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: 960

            Item { Layout.preferredHeight: 24 }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8
                Text {
                    text: root.t ? root.t("welcomeBack") : "Welcome back"
                    color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                    font.pixelSize: 36
                    font.weight: Font.DemiBold
                }
                Text {
                    text: root.t ? root.t("runningStatus") : ""
                    color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                    font.pixelSize: 16
                }
            }

            Components.PairingHintCard {
                themeTokens: root.themeTokens
                text: root.pairingHint
                Layout.fillWidth: true
            }

            Flow {
                Layout.fillWidth: true
                spacing: 24
                maximumWidth: parent.width

                Components.GlassCard {
                    themeTokens: root.themeTokens
                    padding: 24
                    implicitWidth: 200

                    Column {
                        spacing: 12
                        width: parent.width
                        Rectangle {
                            width: 48
                            height: 48
                            radius: 16
                            color: "#33FB923C"
                            Icons.MonitorIcon {
                                anchors.centerIn: parent
                                size: 24
                                color: "#F97316"
                            }
                        }
                        Text {
                            text: root.t ? root.t("onlineDevices") : "Online"
                            color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                            font.pixelSize: 14
                        }
                        Text {
                            text: onlineDevicesCount
                            color: "#F97316"
                            font.pixelSize: 32
                            font.weight: Font.Bold
                        }
                    }
                }
            }

            Components.GlassCard {
                themeTokens: root.themeTokens
                padding: 32
                Layout.fillWidth: true

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 24

                    Text {
                        text: root.t ? root.t("thisMachineInfo") : "This Machine"
                        color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                        font.pixelSize: 24
                        font.weight: Font.DemiBold
                    }

                    GridLayout {
                        columns: 2
                        columnSpacing: 24
                        rowSpacing: 16
                        Layout.fillWidth: true

                        Repeater {
                            model: [
                                { label: root.t ? root.t("deviceName") : "", value: "我的工作电脑", monospace: false },
                                { label: root.t ? root.t("deviceId") : "", value: "RD-2024-10241502", monospace: true },
                                { label: root.t ? root.t("localIp") : "", value: "192.168.1.100", monospace: true },
                                { label: root.t ? root.t("networkStatus") : "", value: root.t ? root.t("lanOnline") : "LAN", monospace: false, status: true }
                            ]
                            delegate: ColumnLayout {
                                Layout.fillWidth: true
                                spacing: 4
                                Text {
                                    text: modelData.label
                                    color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                                    font.pixelSize: 13
                                }
                                RowLayout {
                                    Layout.fillWidth: true
                                    spacing: 8
                                    visible: modelData.status === true

                                    Rectangle {
                                        width: 10
                                        height: 10
                                        radius: 5
                                        color: root.themeTokens ? root.themeTokens.successColor : "#34D399"
                                        SequentialAnimation on opacity {
                                            running: true
                                            loops: Animation.Infinite
                                            NumberAnimation { from: 1; to: 0.4; duration: 800 }
                                            NumberAnimation { from: 0.4; to: 1; duration: 800 }
                                        }
                                    }
                                    Text {
                                        text: modelData.value
                                        color: root.themeTokens ? root.themeTokens.successColor : "#34D399"
                                        font.pixelSize: 16
                                        font.weight: Font.Medium
                                    }
                                }
                                Text {
                                    visible: modelData.status !== true
                                    text: modelData.value
                                    color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                    font.pixelSize: 16
                                    font.family: modelData.monospace ? "Monospace" : ""
                                    font.weight: Font.Medium
                                }
                            }
                        }
                    }
                }
            }

            Components.GlassCard {
                themeTokens: root.themeTokens
                padding: 24
                Layout.fillWidth: true

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 16
                    Text {
                        text: root.t ? root.t("fastActions") : ""
                        color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                        font.pixelSize: 18
                        font.weight: Font.DemiBold
                    }

                    Flow {
                        Layout.fillWidth: true
                        spacing: 16

                        Repeater {
                            model: [
                                {
                                    title: root.t ? root.t("deviceMgmt") : "",
                                    subtitle: root.t ? root.t("viewAllDevices") : "",
                                    color: "#0A84FF",
                                    icon: "grid"
                                },
                                {
                                    title: root.t ? root.t("systemSettings") : "",
                                    subtitle: root.t ? root.t("configureParams") : "",
                                    color: "#A855F7",
                                    icon: "settings"
                                }
                            ]
                            delegate: Rectangle {
                                radius: 16
                                width: Math.min(parent.width, 260)
                                color: root.themeTokens ? root.themeTokens.panelBackground : "#99FFFFFF"
                                border.color: root.themeTokens ? root.themeTokens.panelBorderColor : "#14000000"
                                border.width: 1
                                Layout.fillWidth: true
                                height: 140

                                Column {
                                    anchors.fill: parent
                                    anchors.margins: 16
                                    spacing: 8
                                    Item {
                                        width: 32
                                        height: 32
                                        Rectangle {
                                            anchors.fill: parent
                                            radius: 12
                                            color: modelData.color + "33"
                                        }
                                        Loader {
                                            anchors.centerIn: parent
                                            sourceComponent: modelData.icon === "grid" ? gridIcon : settingsIcon
                                        }
                                    }
                                    Text {
                                        text: modelData.title
                                        color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                        font.pixelSize: 16
                                        font.weight: Font.Medium
                                    }
                                    Text {
                                        text: modelData.subtitle
                                        color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                                        font.pixelSize: 13
                                        wrapMode: Text.WordWrap
                                    }
                                }
                            }
                        }

                        Component { id: gridIcon; Icons.GridIcon { color: "#0A84FF"; size: 22 } }
                        Component { id: settingsIcon; Icons.SettingsIcon { color: "#A855F7"; size: 22 } }
                    }
                }
            }

            Item { Layout.preferredHeight: 40 }
        }
    }
}
