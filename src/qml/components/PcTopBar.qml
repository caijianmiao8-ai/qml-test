import QtQuick 6.5
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "icons" as Icons

Item {
    id: root
    property var themeTokens
    signal minimizeRequested()
    signal fullscreenToggleRequested()
    signal closeRequested()

    implicitHeight: 56

    RowLayout {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 24
        spacing: 12

        IconButton {
            icon: Icons.MinusIcon {}
            accessibleName: "Minimize"
            textColor: root.themeTokens ? root.themeTokens.textSecondary : "#94A3B8"
            hoverColor: root.themeTokens ? root.themeTokens.subtleHoverBackground : "#1AFFFFFF"
            onClicked: root.minimizeRequested()
        }
        IconButton {
            icon: Icons.MaximizeIcon {}
            accessibleName: "Fullscreen"
            textColor: root.themeTokens ? root.themeTokens.textSecondary : "#94A3B8"
            hoverColor: root.themeTokens ? root.themeTokens.subtleHoverBackground : "#1AFFFFFF"
            onClicked: root.fullscreenToggleRequested()
        }
        IconButton {
            icon: Icons.CloseIcon {}
            accessibleName: "Close"
            textColor: root.themeTokens ? root.themeTokens.dangerText : "#F87171"
            hoverColor: "#1AF87171"
            onClicked: root.closeRequested()
        }
    }

    component IconButton: Control {
        id: control
        property Item icon
        property string accessibleName: ""
        property color textColor: "#FFFFFF"
        property color hoverColor: "#26FFFFFF"
        implicitWidth: 32
        implicitHeight: 32
        background: Rectangle {
            radius: 10
            color: control.hovered ? control.hoverColor : "#00000000"
        }
        contentItem: Item {
            anchors.centerIn: parent
            width: 16
            height: 16
            implicitWidth: 16
            implicitHeight: 16
            Loader {
                id: iconLoader
                anchors.centerIn: parent
                sourceComponent: control.icon
                onItemChanged: {
                    if (item && item.hasOwnProperty("color")) {
                        item.color = control.textColor
                    }
                }
            }
        }
        Accessible.name: accessibleName
    }
}
