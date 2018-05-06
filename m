Return-Path: john@mib-infotech.co.nz
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d7aa807
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 00:12:35 +0000 (UTC)
Received: from mail-pg0-x22d.google.com (mail-pg0-x22d.google.com
 [IPv6:2607:f8b0:400e:c05::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18cc92b4
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 00:12:34 +0000 (UTC)
Received: by mail-pg0-x22d.google.com with SMTP id p9-v6so14900938pgc.9
 for <wireguard@lists.zx2c4.com>; Sat, 05 May 2018 17:14:44 -0700 (PDT)
Return-Path: <john@mib-infotech.co.nz>
Received: from [10.16.226.11] ([103.247.155.34])
 by smtp.gmail.com with ESMTPSA id z127-v6sm30387009pgb.31.2018.05.05.17.14.41
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 05 May 2018 17:14:43 -0700 (PDT)
Subject: RFE: Name of peer in configuration
To: wireguard@lists.zx2c4.com
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q-wmyXw7pyLRK3YLDZxCHgKaPbx2ZJe75Yrnb4BQzwCQ@mail.gmail.com>
 <8d2259a4-15cf-d036-7dd8-fb18e8311aac@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
 <CAKXLc7dZD1Qzx1q1fPPikXPvu+vAgCpKnBBiP_hKSiJOtTbxng@mail.gmail.com>
 <CAHLp1Y=S0EmJHJ5kKJMJnd=0==QqCGVX4HXrYV62H=Nk+nx96Q@mail.gmail.com>
From: John Huttley <john@mib-infotech.co.nz>
Message-ID: <ea5392dc-3a92-e7d7-5028-234921dc2e10@mib-infotech.co.nz>
Date: Sun, 6 May 2018 12:14:38 +1200
MIME-Version: 1.0
In-Reply-To: <CAHLp1Y=S0EmJHJ5kKJMJnd=0==QqCGVX4HXrYV62H=Nk+nx96Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi
we can can put comments into  configuration files but on
wg show

these are lost

Request:
Add name or Description or comment field to the [peer] stanza

[Peer]
       PublicKey = OYXXXXmTNf2RpiIBW4=
       Endpoint = gatekeeper.hisdad.org:999
       AllowedIPs = 192.168.94.0/24, 192.168.95.0/24
       Name =  "gatekeeper home server"


Then wg show


peer: OYXXXXmTNf2RpiIBW4=
   name: "gatekeeper home server"
   endpoint: 210.54.33.48:999
   allowed ips: 192.168.95.0/24, 192.168.94.0/24
   latest handshake: 2 minutes, 9 seconds ago
   transfer: 455.03 MiB received, 56.57 MiB sent

Regards,
dad
