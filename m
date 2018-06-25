Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d44fa518
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 23:44:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdc4f856
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 23:44:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80d8590a
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 23:43:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 028f7c19
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 23:43:26 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id c6-v6so14257596oiy.0
 for <wireguard@lists.zx2c4.com>; Mon, 25 Jun 2018 16:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20180624155124.GP30528@isi.edu>
In-Reply-To: <20180624155124.GP30528@isi.edu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 26 Jun 2018 01:49:56 +0200
Message-ID: <CAHmME9rTmU6LTtadmDs__btxBC7S8K_GVKnn47F5TEZ6n3WF-Q@mail.gmail.com>
Subject: Re: wireguard-tools: hard coded config paths in wg-quick
To: calvin@isi.edu
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

Hi Calvin,

That's a good suggestion, and probably something best handled by a
small sed or replacement command in the homebrew formula, where you
invoke the "brew path" command. Would you like to implement this and
CC @zx2c4 on the github PR?

Regards,
Jason
