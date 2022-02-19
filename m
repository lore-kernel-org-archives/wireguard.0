Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8127C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Feb 2022 17:35:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id cf89778c;
	Sat, 19 Feb 2022 17:35:30 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c6db26f3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Feb 2022 17:35:28 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso15071326pjt.4
 for <wireguard@lists.zx2c4.com>; Sat, 19 Feb 2022 09:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=nkO1yMNql/ZIv8HPRyQ6UA62lxiDVj72dmCUoFsosDs=;
 b=GCK96d3nMnUK/6qEer5leu1Nuly5bsK1JefvrD/KRO6qYra5U1ZoUZbz/4CyZr16To
 jMaogkNLdQGwkRl0PBOcZR1Zt/NH6n2YJN3/UAHQmIlvR0XG5XYtcLI5c68KRuMrACI3
 3shHJUs/OoH4LFh+pKmwQLEa1hVGBa+9s7cqNu83Wb9CdpzwJj6EQ1W76qt7oY8yaleH
 ActDk6cA2OAPeSvJ7BZ/BEp04aWfwb1eetMJZpNrMdlqFtTj7Ze8z5bR7iU0CNyF71ou
 ZiWXJr2eRsPFVo5f+uQNWDWE0grWJ2k8zu/FaxhmB6xRArKPz6KI5KbP83B0f5JBylPy
 o05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nkO1yMNql/ZIv8HPRyQ6UA62lxiDVj72dmCUoFsosDs=;
 b=IoCMG6SWewHQyxWLbTtwm7bpHWxEH4eMZ3o/rqH1jJg7pI3VC4MSejunL8xR5rHnmV
 CW0J4o8XIXy+z45lqRg32j+7S1t6831XdFQLx2oOl4w+JEKQDuXXR1Bi4js1mUXCyChf
 Sj2xAZplyij3EPHwq3AZzTrhXluDl8f8738gNug0tx9xWzW2ZE9901627iv5lXzRV+uA
 YHzgns307L1l170Nv7zvWJZlUPjxJNENJsJqgjdmT7TQiqCw2JpNGlEmR2mhXZq0KE//
 rC2Qs/EttaokW7QWdc565aKtgm6PyJET8IrYQaDlk3RuJtEMEGpHztljcUBu0wj/pT/O
 2Njw==
X-Gm-Message-State: AOAM531Q2m0Mv4pQ2nhXa/cqVSLuo+UTmdfiTJumuI++AbNTrA2yx/bz
 5AdycDEcjmRUJzfAJUg+TiOTZOwdqxsDbumA9bq/nNKps3CzNPHr
X-Google-Smtp-Source: ABdhPJz+7JE6idMd8ZqmIYslgM8jCjq93igMS4QxGoeDhqCEs1UvBBMIfl0/HNxqt9OzWnuWcDy8jER0xRBb1teYIi8=
X-Received: by 2002:a17:90b:4d84:b0:1b9:4109:7118 with SMTP id
 oj4-20020a17090b4d8400b001b941097118mr17962559pjb.119.1645292126753; Sat, 19
 Feb 2022 09:35:26 -0800 (PST)
MIME-Version: 1.0
From: Houman <houmie@gmail.com>
Date: Sat, 19 Feb 2022 17:34:50 +0000
Message-ID: <CABBZOsnRAS1bz_hT863E+GAn9D8=OXAvvsnuZhQbxsRZNVToDA@mail.gmail.com>
Subject: Is there a Delegate for the Wireguard status in PacketTunnelProvider
 (iOS)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

I wonder if there is a Delegate we could use in PacketTunnelProvider
to observe the state of Wireguard VPN.

For example OpenVPN has something like this:

extension PacketTunnelProvider: OpenVPNAdapterDelegate {
    func openVPNAdapter(_ openVPNAdapter: OpenVPNAdapter, handleEvent
event: OpenVPNAdapterEvent, message: String?) {
        switch event {
        case .connected:
        case .disconnected:
        case .reconnecting:
        default:
            break
        }
    }
}

Do we have this in Wireguard?

I know it's possible to subscribe to this NEVPNStatusDidChange in the
main app instead:

override func viewDidLoad() {
    NotificationCenter.default.addObserver(self, selector:
#selector(vpnStatusDidChange(_:)), name:
NSNotification.Name.NEVPNStatusDidChange, object: nil)
}

But this doesn't work well for Third party VPNs that integrate over
the NetworkExtension framework. Even though I have observed this once,
I see multiple connected states being triggered, after connecting a
single time to the VPN.

@objc private func vpnStatusDidChange(_ notification: Notification) {
        let nevpnconn = notification.object as! NEVPNConnection
        let status = nevpnconn.status
        switch status {
        case NEVPNStatus.invalid:
        case NEVPNStatus.disconnected:
        case NEVPNStatus.connecting:
        case NEVPNStatus.connected:
...
}

Any suggestions please?
Thanks,
