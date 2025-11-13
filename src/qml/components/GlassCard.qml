import QtQuick 6.5
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

Control {
    id: root
    property var themeTokens
    padding: 24
    implicitWidth: contentItem.implicitWidth + leftPadding + rightPadding
    implicitHeight: contentItem.implicitHeight + topPadding + bottomPadding

    background: Item {
        implicitWidth: root.contentItem.implicitWidth
        implicitHeight: root.contentItem.implicitHeight
        anchors.fill: parent
        layer.enabled: false
        DropShadow {
            anchors.fill: card
            source: card
            horizontalOffset: 0
            verticalOffset: 24
            radius: 48
            samples: 32
            color: root.themeTokens ? root.themeTokens.cardShadowColor : "#33000000"
            cached: true
            visible: root.themeTokens !== undefined
        }
        Rectangle {
            id: card
            anchors.fill: parent
            color: root.themeTokens ? root.themeTokens.cardBackground : "#CCFFFFFF"
            radius: 20
            border.color: root.themeTokens ? root.themeTokens.cardBorderColor : "#14000000"
            border.width: 1
        }
    }

    contentItem: Item {
        id: container
        implicitWidth: childrenRect.width
        implicitHeight: childrenRect.height
        anchors.margins: 0
        default property alias data: container.data
    }
}
