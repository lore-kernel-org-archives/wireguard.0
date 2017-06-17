Return-Path: prvs=134175e26d=sattler@med.uni-frankfurt.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 277e5bf2
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Jun 2017 09:05:45 +0000 (UTC)
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
 [141.2.22.233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb0732bc
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Jun 2017 09:05:44 +0000 (UTC)
Received: from smtpauth2.cluster.uni-frankfurt.de ([10.1.1.238])
 by mailout.rz.uni-frankfurt.de with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <sattler@med.uni-frankfurt.de>) id 1dM9ub-0007KJ-HN
 for wireguard@lists.zx2c4.com; Sat, 17 Jun 2017 11:20:57 +0200
Received: from p5790facb.dip0.t-ipconnect.de ([87.144.250.203]
 helo=[192.168.2.17])
 by smtpauth2.cluster.uni-frankfurt.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89)
 (envelope-from <sattler@med.uni-frankfurt.de>) id 1dM9ub-0005i5-BU
 for wireguard@lists.zx2c4.com; Sat, 17 Jun 2017 11:20:57 +0200
Subject: Re: Trouble running a proxy VPN
To: wireguard@lists.zx2c4.com
References: <3bd46519-ee20-8b1a-ca88-95b60bbc9e81@cis-india.org>
 <CAHmME9rRBxMvHMkGMRchDoDU1Ok7_J-nxCKydg6oo=3O+1b00g@mail.gmail.com>
 <8645b2da-6787-8b3a-737b-c3fbc8f7b6a2@cis-india.org>
From: Thomas Sattler <sattler@med.uni-frankfurt.de>
Message-ID: <9600eaca-6bec-2b2a-2f5b-4c0d5940a151@med.uni-frankfurt.de>
Date: Sat, 17 Jun 2017 11:20:56 +0200
MIME-Version: 1.0
In-Reply-To: <8645b2da-6787-8b3a-737b-c3fbc8f7b6a2@cis-india.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Am 17.06.2017 um 06:26 schrieb Pranesh Prakash:
> Step 2: Change /etc/sysctl.conf to allow the forwarding of IPv4 packets
> even after reboots:
> $ sudo sed '/ip_forward/s/^# *//' /etc/sysctl.conf

Shouldn't this be "sed -i" instead of just "sed"?

Thomas
