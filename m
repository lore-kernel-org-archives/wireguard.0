Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eafa9ae8
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Apr 2018 05:03:16 +0000 (UTC)
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
 [209.85.218.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8bc40c1a
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Apr 2018 05:03:14 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id t27-v6so22941179oij.9
 for <wireguard@lists.zx2c4.com>; Wed, 25 Apr 2018 22:04:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <9fa638b5-3f03-a35b-5341-8e7240193bd4@attglobal.net>
References: <9fa638b5-3f03-a35b-5341-8e7240193bd4@attglobal.net>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Thu, 26 Apr 2018 07:03:49 +0200
Message-ID: <CAKXLc7f+5KTcNQfAfo-JhghJA=kyfj20F2fPyGU502L65-t0Eg@mail.gmail.com>
Subject: Re: Cannot ping Windows machines on server network
To: stunnel@attglobal.net
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

On Thu, Apr 26, 2018 at 1:06 AM, Eddie <stunnel@attglobal.net> wrote:
> They are pingable from the server and all other machines on the network.
> There are no routing of firewall rules anywhere that call out these 2
> machines either by IP or name.
>
Are you sure they are pingable? By default Windows client boxes not
reply to ping.

The 1st answer that came up:
https://answers.microsoft.com/en-us/windows/forum/windows_7-networking/how-to-enable-ping-response-in-windows-7/5aff5f8d-f138-4c9a-8646-5b3a99f1cae6

Kalin.
