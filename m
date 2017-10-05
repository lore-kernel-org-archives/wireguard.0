Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a43851e
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2017 12:40:56 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 298b4af8
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2017 12:40:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60078ee4
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2017 12:59:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6724ced9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2017 12:59:58 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id p187so24507787oif.4
 for <wireguard@lists.zx2c4.com>; Thu, 05 Oct 2017 06:10:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CY1PR0501MB15797EB039F2510EA00B0303C4700@CY1PR0501MB1579.namprd05.prod.outlook.com>
References: <CY1PR0501MB157904D69DD3E95529A3E04AC4730@CY1PR0501MB1579.namprd05.prod.outlook.com>
 <CAHmME9qQTch=-yCfHr0xTBLk+bHBWw675WEiY8+BM58_2vq+Ug@mail.gmail.com>
 <CY1PR0501MB15797EB039F2510EA00B0303C4700@CY1PR0501MB1579.namprd05.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Oct 2017 15:10:03 +0200
Message-ID: <CAHmME9rRo3jeKhdD-6JuWijZLnSdoGc_POx-jrELWgdm4Um6wA@mail.gmail.com>
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

Hey Andrey,

Arg that's annoying. There are still evidently changes in recent
CentOS kernels. I'll spin up a VM now to try this all out and will
send you an updated patch shortly.

Jason
