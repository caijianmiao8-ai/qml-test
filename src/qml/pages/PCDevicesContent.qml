import QtQuick 6.5
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "../components" as Components
import "../components/icons" as Icons

Item {
    id: root
    property var themeTokens
    property var t
    property string pairingHint: ""
    property var devicesModel
    property var controllersModel

    Components.ScrollArea {
        anchors.fill: parent
        themeTokens: root.themeTokens

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 32
            Layout.maximumWidth: 960
            Layout.alignment: Qt.AlignHCenter

            Item { Layout.preferredHeight: 24 }

            RowLayout {
                Layout.fillWidth: true
                spacing: 16
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8
                    Text {
                        text: root.t ? root.t("devicesPageTitle") : "Devices"
                        color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                        font.pixelSize: 36
                        font.weight: Font.DemiBold
                    }
                    Text {
                        text: root.t ? root.t("devicesPageDesc") : ""
                        color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                        font.pixelSize: 14
                        wrapMode: Text.WordWrap
                    }
                }

                RowLayout {
                    Layout.alignment: Qt.AlignTop
                    spacing: 12
                    Button {
                        text: root.t ? root.t("search") : "Search"
                        Layout.preferredWidth: 140
                        background: Rectangle {
                            radius: 14
                            color: root.themeTokens ? root.themeTokens.panelBackground : "#99FFFFFF"
                            border.color: root.themeTokens ? root.themeTokens.panelBorderColor : "#14000000"
                            border.width: 1
                        }
                        contentItem: RowLayout {
                            spacing: 8
                            anchors.centerIn: parent
                            Icons.SearchIcon { size: 18; color: root.themeTokens ? root.themeTokens.textPrimary : "#111827" }
                            Text {
                                text: root.t ? root.t("search") : "Search"
                                color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                font.pixelSize: 14
                                font.weight: Font.Medium
                            }
                        }
                    }
                    Button {
                        text: root.t ? root.t("filter") : "Filter"
                        Layout.preferredWidth: 140
                        background: Rectangle {
                            radius: 14
                            color: root.themeTokens ? root.themeTokens.panelBackground : "#99FFFFFF"
                            border.color: root.themeTokens ? root.themeTokens.panelBorderColor : "#14000000"
                            border.width: 1
                        }
                        contentItem: RowLayout {
                            spacing: 8
                            anchors.centerIn: parent
                            Icons.FilterIcon { size: 18; color: root.themeTokens ? root.themeTokens.textPrimary : "#111827" }
                            Text {
                                text: root.t ? root.t("filter") : "Filter"
                                color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                font.pixelSize: 14
                                font.weight: Font.Medium
                            }
                        }
                    }
                }
            }

            Components.PairingHintCard {
                themeTokens: root.themeTokens
                text: root.pairingHint
                Layout.fillWidth: true
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 16
                Text {
                    text: root.t ? root.t("controllersTitle") : ""
                    color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                    font.pixelSize: 24
                    font.weight: Font.DemiBold
                }
                Text {
                    text: root.t ? root.t("controllersDesc") : ""
                    color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                    font.pixelSize: 14
                    wrapMode: Text.WordWrap
                }

                Flow {
                    Layout.fillWidth: true
                    spacing: 24

                    Repeater {
                        model: root.controllersModel
                        delegate: Components.GlassCard {
                            themeTokens: root.themeTokens
                            padding: 24
                            width: Math.min(parent.width, 360)
                            ColumnLayout {
                                Layout.fillWidth: true
                                spacing: 16

                                RowLayout {
                                    Layout.fillWidth: true
                                    spacing: 16
                                    Rectangle {
                                        width: 64
                                        height: 64
                                        radius: 18
                                        color: model.online ? "#330A84FF" : "#FF64748B"
                                        RowLayout.fillHeight: false

                                        Icons.SmartphoneIcon {
                                            anchors.centerIn: parent
                                            size: 32
                                            color: "#FFFFFF"
                                        }
                                    }

                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        spacing: 4
                                        Text {
                                            text: model.name
                                            color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                            font.pixelSize: 20
                                            font.weight: Font.DemiBold
                                            wrapMode: Text.WordWrap
                                        }
                                        Text {
                                            text: model.os
                                            color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                                            font.pixelSize: 13
                                            elide: Text.ElideRight
                                        }
                                    }

                                    Components.StatusBadge {
                                        online: model.online
                                        themeTokens: root.themeTokens
                                        textOnline: root.t ? root.t("statusOnline") : "Online"
                                        textOffline: root.t ? root.t("statusOffline") : "Offline"
                                    }
                                }

                                ColumnLayout {
                                    Layout.fillWidth: true
                                    spacing: 8
                                    RowLayout {
                                        Layout.fillWidth: true
                                        Text {
                                            text: root.t ? root.t("lastActive") : "Last"
                                            color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                                            font.pixelSize: 13
                                        }
                                        Text {
                                            text: model.lastActive
                                            color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                            font.pixelSize: 13
                                        }
                                    }
                                }

                                RowLayout {
                                    Layout.fillWidth: true
                                    spacing: 12
                                    Button {
                                        Layout.fillWidth: true
                                        text: root.t ? root.t("manage") : "Manage"
                                        background: Rectangle {
                                            radius: 14
                                            color: root.themeTokens ? root.themeTokens.panelBackground : "#99FFFFFF"
                                            border.color: root.themeTokens ? root.themeTokens.panelBorderColor : "#14000000"
                                            border.width: 1
                                        }
                                        contentItem: Text {
                                            anchors.centerIn: parent
                                            text: root.t ? root.t("manage") : "Manage"
                                            color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                            font.pixelSize: 14
                                            font.weight: Font.Medium
                                        }
                                    }
                                    Button {
                                        width: 48
                                        background: Rectangle {
                                            radius: 14
                                            color: "#1AF87171"
                                            border.color: "#4DF87171"
                                            border.width: 1
                                        }
                                        contentItem: Icons.TrashIcon {
                                            anchors.centerIn: parent
                                            size: 16
                                            color: root.themeTokens ? root.themeTokens.dangerText : "#F87171"
                                        }
                                        Accessible.name: root.t ? root.t("remove") : "Remove"
                                    }
                                }
                            }
                        }
                    }
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 16
                Text {
                    text: root.t ? root.t("registeredDevicesTitle") : ""
                    color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                    font.pixelSize: 24
                    font.weight: Font.DemiBold
                }
                Text {
                    text: root.t ? root.t("registeredDevicesDesc") : ""
                    color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                    font.pixelSize: 14
                    wrapMode: Text.WordWrap
                }

                Flow {
                    Layout.fillWidth: true
                    spacing: 24

                    Repeater {
                        model: root.devicesModel
                        delegate: Components.GlassCard {
                            themeTokens: root.themeTokens
                            padding: 24
                            width: Math.min(parent.width, 360)
                            ColumnLayout {
                                Layout.fillWidth: true
                                spacing: 16

                                RowLayout {
                                    Layout.fillWidth: true
                                    spacing: 16
                                    Rectangle {
                                        width: 64
                                        height: 64
                                        radius: 18
                                        color: model.online ? "#330A84FF" : "#FF94A3B8"
                                        Icons.MonitorIcon {
                                            anchors.centerIn: parent
                                            size: 32
                                            color: "#FFFFFF"
                                        }
                                    }

                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        spacing: 4
                                        Text {
                                            text: model.name
                                            color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                            font.pixelSize: 20
                                            font.weight: Font.DemiBold
                                            wrapMode: Text.WordWrap
                                        }
                                        Text {
                                            text: model.os
                                            color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                                            font.pixelSize: 13
                                            elide: Text.ElideRight
                                        }
                                    }

                                    Components.StatusBadge {
                                        online: model.online
                                        themeTokens: root.themeTokens
                                        textOnline: root.t ? root.t("statusOnline") : "Online"
                                        textOffline: root.t ? root.t("statusOffline") : "Offline"
                                    }
                                }

                                ColumnLayout {
                                    Layout.fillWidth: true
                                    spacing: 8
                                    RowLayout {
                                        Layout.fillWidth: true
                                        Text {
                                            text: root.t ? root.t("ipAddress") : "IP"
                                            color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                                            font.pixelSize: 13
                                        }
                                        Text {
                                            text: model.ip
                                            color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                            font.pixelSize: 13
                                            font.family: "Monospace"
                                        }
                                    }
                                    RowLayout {
                                        Layout.fillWidth: true
                                        Text {
                                            text: root.t ? root.t("lastSeen") : "Last"
                                            color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                                            font.pixelSize: 13
                                        }
                                        Text {
                                            text: model.lastConnect
                                            color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                            font.pixelSize: 13
                                        }
                                    }
                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        visible: model.online
                                        spacing: 8
                                        RowLayout {
                                            Layout.fillWidth: true
                                            Text {
                                                text: root.t ? root.t("netMode") : "Net"
                                                color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                                                font.pixelSize: 13
                                            }
                                            Text {
                                                text: model.network
                                                color: model.network === "LAN" ? (root.themeTokens ? root.themeTokens.successColor : "#34D399")
                                                      : model.network === "P2P" ? "#22D3EE" : "#FB923C"
                                                font.pixelSize: 13
                                                font.weight: Font.Medium
                                            }
                                        }
                                        RowLayout {
                                            Layout.fillWidth: true
                                            Text {
                                                text: root.t ? root.t("delay") : "Delay"
                                                color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
                                                font.pixelSize: 13
                                            }
                                            Text {
                                                text: model.delay
                                                color: root.themeTokens ? root.themeTokens.successColor : "#34D399"
                                                font.pixelSize: 13
                                                font.weight: Font.Medium
                                            }
                                        }
                                    }
                                }

                                RowLayout {
                                    Layout.fillWidth: true
                                    spacing: 12
                                    Button {
                                        Layout.fillWidth: true
                                        text: root.t ? root.t("manage") : "Manage"
                                        background: Rectangle {
                                            radius: 14
                                            color: root.themeTokens ? root.themeTokens.panelBackground : "#99FFFFFF"
                                            border.color: root.themeTokens ? root.themeTokens.panelBorderColor : "#14000000"
                                            border.width: 1
                                        }
                                        contentItem: Text {
                                            anchors.centerIn: parent
                                            text: root.t ? root.t("manage") : "Manage"
                                            color: root.themeTokens ? root.themeTokens.textPrimary : "#111827"
                                            font.pixelSize: 14
                                            font.weight: Font.Medium
                                        }
                                    }
                                    Button {
                                        width: 48
                                        background: Rectangle {
                                            radius: 14
                                            color: "#1AF87171"
                                            border.color: "#4DF87171"
                                            border.width: 1
                                        }
                                        contentItem: Icons.TrashIcon {
                                            anchors.centerIn: parent
                                            size: 16
                                            color: root.themeTokens ? root.themeTokens.dangerText : "#F87171"
                                        }
                                        Accessible.name: root.t ? root.t("remove") : "Remove"
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Item { Layout.preferredHeight: 40 }
        }
    }
}
