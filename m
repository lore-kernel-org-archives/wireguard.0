Return-Path: john@mib-infotech.co.nz
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a155ac5d
 for <wireguard@lists.zx2c4.com>; Wed, 8 Feb 2017 23:10:09 +0000 (UTC)
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a23de874
 for <wireguard@lists.zx2c4.com>; Wed, 8 Feb 2017 23:10:09 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id v184so51729945pgv.3
 for <wireguard@lists.zx2c4.com>; Wed, 08 Feb 2017 15:23:39 -0800 (PST)
Return-Path: <john@mib-infotech.co.nz>
Received: from [10.16.226.44] ([103.247.155.34])
 by smtp.gmail.com with ESMTPSA id v8sm3643501pgo.14.2017.02.08.15.23.35
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Feb 2017 15:23:36 -0800 (PST)
Subject: mint (ubuntu) kernel Signing
To: wireguard@lists.zx2c4.com
References: <20161122130805.GG20343@tuxmachine.polynome.dn42>
 <CAHmME9pMMpmS5BNEeAeRNDLF6ZdDOVkbLVTaUTBM3Yk=u1mGAw@mail.gmail.com>
From: john huttley <john@mib-infotech.co.nz>
Message-ID: <505f3f87-16a9-3020-ad9f-10d1c71749e3@mib-infotech.co.nz>
Date: Thu, 9 Feb 2017 12:23:32 +1300
MIME-Version: 1.0
In-Reply-To: <CAHmME9pMMpmS5BNEeAeRNDLF6ZdDOVkbLVTaUTBM3Yk=u1mGAw@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Team,
I had been using the git version on my Mint 18.1 laptop

4.4.0-62-generic #83-Ubuntu SMP Wed Jan 18 14:09:55 UTC 2017 i686 i686 
i686 GNU/Linux

After upgrading the kernel to the above, it won't install the module.

I understand that this is because the module must be signed.


Does anyone have any experience with this?

Regards,

John
