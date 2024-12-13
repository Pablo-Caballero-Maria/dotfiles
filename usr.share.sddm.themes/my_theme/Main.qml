import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import SddmComponents 2.0

Rectangle {
    id: root
    width: 1366
    height: 768
    color: "transparent"


    Image {
        id: backgroundImage
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        id: loginBox
        width: 400
        height: 300
        color: Qt.rgba(0, 0, 0, 0.3)
        radius: 10
        anchors.centerIn: parent

	
        ColumnLayout {
            anchors.centerIn: parent
            spacing: 20
            width: parent.width - 60

            TextField {
                id: usernameField
                placeholderText: "Username"
                Layout.fillWidth: true
                height: 40
                color: "#ffffff"
                background: Rectangle {
                    color: "#3d3d3d"
                    radius: 5
                }
                onAccepted: passwordField.focus = true
            }

            TextField {
                id: passwordField
                placeholderText: "Password"
                echoMode: TextInput.Password
                Layout.fillWidth: true
                height: 40
                color: "#ffffff"
                background: Rectangle {
                    color: "#3d3d3d"
                    radius: 5
                }
                onAccepted: loginButton.clicked()
            }

            Rectangle {
                id: loginButton
                Layout.fillWidth: true
                height: 40
                color: mouseArea.pressed ? "#404040" : "#4a4a4a"
                radius: 5

                Text {
                    anchors.centerIn: parent
                    text: "Login"
                    color: "#ffffff"
                }

		// the last number is: 0 for cosmic, 1 for hyprland
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onClicked: sddm.login(usernameField.text, passwordField.text, 1)  // Using 0 as default session index
                }
            }
        }
    }
}
