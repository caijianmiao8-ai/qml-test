import QtQuick 6.5
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    property var themeTokens
    property alias contentItem: column
    default property alias contentData: column.data

    Flickable {
        id: flickable
        anchors.fill: parent
        contentWidth: width
        contentHeight: column.implicitHeight
        clip: true
        interactive: contentHeight > height
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar {
            id: vScroll
            policy: ScrollBar.AsNeeded
            width: 6
            padding: 2
            implicitWidth: 6
            contentItem: Rectangle {
                radius: width / 2
                color: root.themeTokens ? root.themeTokens.offlineBadgeText : "#94A3B8"
            }
        }

        Item {
            id: contentWrapper
            width: flickable.width
            implicitHeight: column.implicitHeight

            ColumnLayout {
                id: column
                width: flickable.width
                spacing: 24
            }
        }
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 24
        gradient: Gradient {
            GradientStop { position: 0.0; color: root.themeTokens ? root.themeTokens.scrollGradientColor : "#14000000" }
            GradientStop { position: 1.0; color: "#00000000" }
        }
        visible: flickable.contentY > 0
        opacity: 0.8
        z: 2
        MouseArea { anchors.fill: parent; enabled: false }
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 24
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#00000000" }
            GradientStop { position: 1.0; color: root.themeTokens ? root.themeTokens.scrollGradientColor : "#14000000" }
        }
        visible: flickable.contentY + flickable.height < flickable.contentHeight
        opacity: 0.8
        z: 2
        MouseArea { anchors.fill: parent; enabled: false }
    }
}
