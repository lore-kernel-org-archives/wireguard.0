Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01de8c13
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 01:36:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bb5cba9
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 01:36:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4227c602
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 01:36:37 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id o141so48036863lff.1
 for <wireguard@lists.zx2c4.com>; Sun, 13 Nov 2016 17:39:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <bcc61a59-1fbf-adb6-aa82-2e53821f215d@mib-infotech.co.nz>
References: <27cccef1-06d9-74b3-5b8a-912850119a76@cumulusnetworks.com>
 <20161113232813.28926-1-Jason@zx2c4.com>
 <bcc61a59-1fbf-adb6-aa82-2e53821f215d@mib-infotech.co.nz>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 14 Nov 2016 02:39:06 +0100
Message-ID: <CAHmME9o8zt+5uq=yuw1jsZZhMRcwLasPjpk=O5tpjcp_+55HNQ@mail.gmail.com>
To: John Huttley <john@mib-infotech.co.nz>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Debugging AllowedIps
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi John,

Compile with `make debug`, and in dmesg you'll have lots of debug
output. You can also post your configuration and working understanding
here, and we'll see if we can help that way too.

Jason
