Return-Path: john@mib-infotech.co.nz
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
 [209.85.192.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4fbc9c0
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 01:34:28 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id 189so25846564pfz.3
 for <wireguard@lists.zx2c4.com>; Sun, 13 Nov 2016 17:36:59 -0800 (PST)
Return-Path: <john@mib-infotech.co.nz>
Received: from [10.16.226.44] ([103.247.155.34])
 by smtp.googlemail.com with ESMTPSA id f14sm17468113pfk.5.2016.11.13.17.36.56
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Nov 2016 17:36:57 -0800 (PST)
To: wireguard@lists.zx2c4.com
References: <27cccef1-06d9-74b3-5b8a-912850119a76@cumulusnetworks.com>
 <20161113232813.28926-1-Jason@zx2c4.com>
From: John Huttley <john@mib-infotech.co.nz>
Message-ID: <bcc61a59-1fbf-adb6-aa82-2e53821f215d@mib-infotech.co.nz>
Date: Mon, 14 Nov 2016 14:36:53 +1300
MIME-Version: 1.0
In-Reply-To: <20161113232813.28926-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Subject: [WireGuard] Debugging AllowedIps
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Team,
I've had success with AllowedIPs = 0.0.0.0/0
but not otherwise.

Is there a way of get some debug output on this?

Regards,
John
