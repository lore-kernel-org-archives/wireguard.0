Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14c7cb84
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 15:08:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a7507c4
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 15:08:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 805e7c02
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 15:08:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bdc60081
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 15:08:49 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id 128so288218453oig.0
 for <wireguard@lists.zx2c4.com>; Mon, 02 Jan 2017 07:17:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qQ495gt_zByeJDA3_x+eKMoVWOjzJypiUQnHVJvq6BWQ@mail.gmail.com>
References: <CAHmME9qQ495gt_zByeJDA3_x+eKMoVWOjzJypiUQnHVJvq6BWQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 2 Jan 2017 16:17:30 +0100
Message-ID: <CAHmME9q1RQ_Z3tikOkOECsw5xNx5Mttwm5=MPV7PRqu+DcipkA@mail.gmail.com>
Subject: Re: [TOOL] wg-config graduates to src/tools, becomes wg-auto-config
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Jan 2, 2017 at 5:57 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Check out the man page, read the script --
> https://git.zx2c4.com/WireGuard/tree/src/tools/wg-auto-config -- and
> please let me know what you think before I cut the next snapshot.
Renamed:
https://git.zx2c4.com/WireGuard/tree/src/tools/wg-auto-config.bash
