import QtQuick 6.5
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import RemoteDesktop 1.0 as Remote

import "icons" as Icons

Remote.GlassCard {
    id: root
    property var themeTokens
    property string text

    contentItem: RowLayout {
        spacing: 12
        anchors.fill: parent
        anchors.margins: 0

        Item {
            Layout.preferredWidth: 32
            Layout.preferredHeight: 32
            Layout.alignment: Qt.AlignTop

            Rectangle {
                anchors.fill: parent
                radius: 12
                color: "#1F0A84FF"
                border.width: 0
            }
            Icons.InfoIcon {
                anchors.centerIn: parent
                color: root.themeTokens ? root.themeTokens.accentGradientStart : "#0A84FF"
                size: 16
            }
        }

        Text {
            text: root.text
            wrapMode: Text.WordWrap
            color: root.themeTokens ? root.themeTokens.textSecondary : "#64748B"
            font.pixelSize: 12
            Layout.fillWidth: true
        }
    }
}
