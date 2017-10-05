Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b2784eb
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2017 04:08:50 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62991351
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2017 04:08:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3184f9b4
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2017 04:27:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4698c1fd
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2017 04:27:52 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id q4so5290428oic.7
 for <wireguard@lists.zx2c4.com>; Wed, 04 Oct 2017 21:37:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CY1PR0501MB157904D69DD3E95529A3E04AC4730@CY1PR0501MB1579.namprd05.prod.outlook.com>
References: <CY1PR0501MB157904D69DD3E95529A3E04AC4730@CY1PR0501MB1579.namprd05.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Oct 2017 06:37:53 +0200
Message-ID: <CAHmME9qQTch=-yCfHr0xTBLk+bHBWw675WEiY8+BM58_2vq+Ug@mail.gmail.com>
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

Sorry about that. I fixed it yesterday in the master branch. I'll roll
a new snapshot soon.

https://git.zx2c4.com/WireGuard/patch/?id=24e742617e47bcdb65ba4ce37fa56a107d75d0f3

Jason
