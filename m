Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af19649b
 for <wireguard@lists.zx2c4.com>; Fri, 2 Mar 2018 13:47:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bad6b391
 for <wireguard@lists.zx2c4.com>; Fri, 2 Mar 2018 13:47:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44b76cc1
 for <wireguard@lists.zx2c4.com>; Fri, 2 Mar 2018 13:38:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 62f3cca0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 2 Mar 2018 13:38:33 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id m22so8752250otf.10
 for <wireguard@lists.zx2c4.com>; Fri, 02 Mar 2018 05:56:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pPRCTf1MyN9RgPKPYZ2Wscnvrgqq9b1gWhMg5ovTu9Xg@mail.gmail.com>
References: <CAHmME9pPRCTf1MyN9RgPKPYZ2Wscnvrgqq9b1gWhMg5ovTu9Xg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 2 Mar 2018 14:56:15 +0100
Message-ID: <CAHmME9pcjsjOTJztgz_XawxUUaOM=GCvs3N9rRvkx_Y8Xzm+-g@mail.gmail.com>
Subject: Re: ephemeral key extraction
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Feb 28, 2018 at 9:11 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> For a few days, I'll run a simple netcat server on demo.wireguard.com.
> Try typing `nc demo.wireguard.com 58812` and then connecting to the
> demo box like usual. Basically, it's every cryptographer's girlfriend
> Eve's wildest fantasy. All of the key compromises all of the time!

By popular demand, for a limited time only, coming to a key compromise
situation near you, with no strings attached, in full bitstream
quality, now avid Eves can get a live pcap in addition to the stream
of ephemeral keys above:

Try running `nc demo.wireguard.com 37281`, and piping it to wireshark.

Happy decrypting!

Jason
