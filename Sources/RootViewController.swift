// SPDX-License-Identifier: MIT
// Copyright (c) 2026 OwnGoal Studio
import UIKit

/// A tiny Hello World test screen.
/// 增量构建验证：改这一行应当触发重新编译。
final class RootViewController: UIViewController {
    private let counterLabel = UILabel()
    private var tapCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Hello World"

        let greetingLabel = UILabel()
        greetingLabel.text = "Hello, World!"
        greetingLabel.font = .systemFont(ofSize: 40, weight: .bold)
        greetingLabel.adjustsFontSizeToFitWidth = true
        greetingLabel.minimumScaleFactor = 0.5
        greetingLabel.accessibilityTraits = .header
        greetingLabel.textAlignment = .center

        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
        let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""
        let detailLabel = UILabel()
        detailLabel.text = "这是一台测试程序\n用 Luros 在本机编译\n版本 \(version) (\(build))"
        detailLabel.font = .preferredFont(forTextStyle: .body)
        detailLabel.adjustsFontForContentSizeCategory = true
        detailLabel.textColor = .secondaryLabel
        detailLabel.numberOfLines = 0
        detailLabel.textAlignment = .center

        counterLabel.text = "点按次数：0"
        counterLabel.font = .preferredFont(forTextStyle: .headline)
        counterLabel.adjustsFontForContentSizeCategory = true
        counterLabel.textAlignment = .center

        let button = UIButton(type: .system)
        button.setTitle("点我一下", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 28, bottom: 12, right: 28)
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)

        let stack = UIStackView(arrangedSubviews: [greetingLabel, detailLabel, counterLabel, button])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }

    @objc private func tapped() {
        tapCount += 1
        counterLabel.text = "点按次数：\(tapCount)"
    }
}
