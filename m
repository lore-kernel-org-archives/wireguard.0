Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd4d9064
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 21:51:35 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fc580b3
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 21:51:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cea1289c
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 21:51:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1092e29a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 21:51:34 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id 128so477581568oig.0
 for <wireguard@lists.zx2c4.com>; Sun, 08 Jan 2017 14:01:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170108204026.29033-1-jftucker@gmail.com>
References: <20170108204026.29033-1-jftucker@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 8 Jan 2017 23:01:04 +0100
Message-ID: <CAHmME9pUtnCop_zVHsWS2eC0srCP4sLdHnf1dsC1Nx3ZnBEDzg@mail.gmail.com>
Subject: Re: [PATCH] uapi: always print valid errors
To: James Tucker <jftucker@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Approached a bit differently, but thanks for catching this:
https://git.zx2c4.com/WireGuard/commit/?id=662235ea4d466584a13ee2edb91eb12a5f553ba6
