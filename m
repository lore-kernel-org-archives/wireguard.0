Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf8fa229
 for <wireguard@lists.zx2c4.com>; Tue, 1 Aug 2017 02:44:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58c75e7c
 for <wireguard@lists.zx2c4.com>; Tue, 1 Aug 2017 02:44:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3369373e
 for <wireguard@lists.zx2c4.com>; Tue, 1 Aug 2017 03:03:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d457a75a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 1 Aug 2017 03:03:27 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id v127so1457610itd.0
 for <wireguard@lists.zx2c4.com>; Mon, 31 Jul 2017 20:05:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA8CD9uo0s0HrYeArMjRS2Hqkrv4hL7tXAfv-vWSkzoANWQ57A@mail.gmail.com>
References: <CAA8CD9uo0s0HrYeArMjRS2Hqkrv4hL7tXAfv-vWSkzoANWQ57A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 1 Aug 2017 05:05:16 +0200
Message-ID: <CAHmME9qD0WzDA39-GLrkpmnBFoM_Ko=u-LnZLnSWUtiVVXuOxg@mail.gmail.com>
Subject: Re: Tunneling protocol in WireGuard
To: Sahil Gupta <sg5414@rit.edu>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Could you elaborate on this question?

WireGuard encapsulates v4 and v6. It _is_ the tunneling protocol.
