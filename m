Return-Path: john@mib-infotech.co.nz
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fd79998
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 21:35:35 +0000 (UTC)
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59ceea55
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 21:35:35 +0000 (UTC)
Received: by mail-pf0-x235.google.com with SMTP id o76so21241983pfi.5
 for <wireguard@lists.zx2c4.com>; Sun, 06 May 2018 14:37:52 -0700 (PDT)
Return-Path: <john@mib-infotech.co.nz>
Received: from [10.16.226.11] ([103.247.155.34])
 by smtp.gmail.com with ESMTPSA id f78sm45317173pfk.138.2018.05.06.14.37.48
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 May 2018 14:37:50 -0700 (PDT)
Subject: Android Configuration File
To: wireguard@lists.zx2c4.com
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
 <CAHmME9r5cwdfDaHCbO50UhREG9z2zv39y+32YYwAYJEfsGDgVA@mail.gmail.com>
 <ad56c93f-5e36-e9a4-42c2-8632c7df86af@gmx.net>
 <4ZK0EJ5btb88Qoa6vz0bpYJHCbhF7h4Z-BBh0ARD4tdwxcwcmdGeUPFuiPrGcdTNmp8Q8p6t4c4vMo7vKwnEIrXdVe56ovqOhiBXi4PdPxs=@protonmail.ch>
 <825a636f-9311-688d-6f30-9ae8d12ea44a@gmx.net> <874ljk24jh.fsf@toke.dk>
 <dfcc55c3-795b-dfa2-7034-74b537519ea4@gmx.net>
 <7qQvJLeSZV3rJnkg9rIdA6yznDPzhIFVR_qUa0hBhmCdr_onJsjzXvKVIlp-ovJiRaX1eENGmtrtcZ_7xsHY7heX2qOvouN8pXTt_J3RurQ=@protonmail.ch>
 <d8bb14e2-43f6-812b-ad5d-3d7b143ae518@gmx.net>
From: John Huttley <john@mib-infotech.co.nz>
Message-ID: <c568bd35-6449-ce60-d075-87ba3346964a@mib-infotech.co.nz>
Date: Mon, 7 May 2018 09:37:44 +1200
MIME-Version: 1.0
In-Reply-To: <d8bb14e2-43f6-812b-ad5d-3d7b143ae518@gmx.net>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I'm just trying to set up the app to talk to my server.
Its unclear what a "configuration file" is. I've presumed it was 
wg-quick compatible.

wg1.conf


[Interface]
     Address = 192.168.94.13/32
       PrivateKey = SNIP

[Peer]
       PublicKey = SNIP
       Endpoint = gatekeeper.hisdad.org:6678
       AllowedIPs = 192.168.94.0/24, 192.168.95.0/24

Is a valid wg-quick file but the app flashes a "Invalid Virtual" or 
something, just for a second.

Whats the requirement?

--dad
