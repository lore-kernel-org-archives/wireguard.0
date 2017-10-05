Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56817e94
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2017 12:53:36 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a5ad192
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2017 12:53:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d23411e6
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2017 13:12:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4d8c6524
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2017 13:12:39 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id u130so24573060oib.11
 for <wireguard@lists.zx2c4.com>; Thu, 05 Oct 2017 06:22:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rRo3jeKhdD-6JuWijZLnSdoGc_POx-jrELWgdm4Um6wA@mail.gmail.com>
References: <CY1PR0501MB157904D69DD3E95529A3E04AC4730@CY1PR0501MB1579.namprd05.prod.outlook.com>
 <CAHmME9qQTch=-yCfHr0xTBLk+bHBWw675WEiY8+BM58_2vq+Ug@mail.gmail.com>
 <CY1PR0501MB15797EB039F2510EA00B0303C4700@CY1PR0501MB1579.namprd05.prod.outlook.com>
 <CAHmME9rRo3jeKhdD-6JuWijZLnSdoGc_POx-jrELWgdm4Um6wA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Oct 2017 15:22:43 +0200
Message-ID: <CAHmME9rM7vwAgZvxmtfHS0vSsN3H-6i1Frx-YetgJWVD9L1Bmw@mail.gmail.com>
Subject: Re: CentOS kernel module build failure
To: Andrey Petrov <apetrov@vmware.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Looks like you'll also need:
https://git.zx2c4.com/WireGuard/patch/?id=e3b70f72236c26cdda6f7538d7a5854c1d0d43f3
