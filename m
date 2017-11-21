Return-Path: germano.massullo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 327f9d85
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 18:07:46 +0000 (UTC)
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4be8f6a0
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 18:07:46 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id v186so5276610wma.2
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 10:12:47 -0800 (PST)
Return-Path: <germano.massullo@gmail.com>
Received: from [192.168.1.100]
 (host179-8-dynamic.56-79-r.retail.telecomitalia.it. [79.56.8.179])
 by smtp.googlemail.com with ESMTPSA id g3sm8183723edi.66.2017.11.21.10.12.46
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Nov 2017 10:12:46 -0800 (PST)
Subject: Re: Gateway for Wireguard VPN
From: Germano Massullo <germano.massullo@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <b68e7d6a-baba-630c-49f5-193899f05d38@gmail.com>
 <CAHmME9rA=kN7ZaTnco4XXAgDRa0bmE6uwM2MSO0qq1Dw=t3czw@mail.gmail.com>
 <2a922e87-81a4-0bbe-8990-2502a91429ef@gmail.com>
Message-ID: <a32ab937-8b60-38f4-b042-64a7c4aa41e4@gmail.com>
Date: Tue, 21 Nov 2017 19:12:45 +0100
MIME-Version: 1.0
In-Reply-To: <2a922e87-81a4-0bbe-8990-2502a91429ef@gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

For who has a Firewalld based Linux distribution like Fedora/RHEL/CentOS:

=== Host B (VPN gateway) ===
When system creates interface wg0, it is not attached to any firewall
zone, so it falls into default zone, that blocks everything except for
ICMP packets. Therefore if you simply run ping among hosts (example from
A to C) everything works, but as soon you try to use a service, it will
not work.
You can solve with
# firewall-cmd --zone=trusted --add-interface=wg0 --permanent
# firewall-cmd --reload

Now from host A you can correctly run
$ ssh user@10.1.0.22
that is the server running on host C
