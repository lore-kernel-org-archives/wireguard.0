Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83880804
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 00:24:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9aaa640
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 00:24:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb0b39dc
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 00:23:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 774f3d96
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 00:23:07 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id k17-v6so1879361oih.5
 for <wireguard@lists.zx2c4.com>; Tue, 15 May 2018 17:24:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK_h9uFnazi0x+Ky_bUn1ZZfaDHas-X-bdLR8x-G=oS-POL5Zg@mail.gmail.com>
References: <20180515225433.GA26432@zx2c4.com>
 <CAK_h9uFnazi0x+Ky_bUn1ZZfaDHas-X-bdLR8x-G=oS-POL5Zg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 May 2018 02:24:36 +0200
Message-ID: <CAHmME9pEPYymEf_BOOGBffkQgCC0O7W5Ofqu9BFJQXvw1PNmuQ@mail.gmail.com>
Subject: Re: [ANNOUNCE] Alpha Snapshots of WireGuard for Android and macOS
To: Tim Sedlmeyer <sedlmeyer@gmail.com>
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

On Wed, May 16, 2018 at 1:09 AM, Tim Sedlmeyer <sedlmeyer@gmail.com> wrote:
> MacOS users should be aware that if you have manually assigned DNS servers
> the current wg-quick implementation will remove them and not restore them.

Wow, that was fast. Indeed, from the source [1], see comment:

set_dns() {
    # TODO: this should use scutil and be slightly more clever. But for now
    # we simply overwrite any _manually set_ DNS servers for all network
    # services. This means we get into trouble if the user doesn't actually
    # want DNS via DHCP when setting this back to "empty". Because macOS is
    # so horrible to deal with here, we'll simply wait for irate users to
    # provide a patch themselves.
    local service response
    { read -r _; while read -r service; do
        [[ $service == "*"* ]] && service="${service:1}"
        while read -r response; do
            [[ $response == *Error* ]] && echo "$response" >&2
        done < <(cmd networksetup -setdnsservers "$service" "${DNS[@]}")
    done; } < <(networksetup -listallnetworkservices)
}

del_dns() {
    local service response
    { read -r _; while read -r service; do
        [[ $service == "*"* ]] && service="${service:1}"
        while read -r response; do
            [[ $response == *Error* ]] && echo "$response" >&2
        done < <(cmd networksetup -setdnsservers "$service" Empty)
    done; } < <(networksetup -listallnetworkservices)
}

If you'd like to contribute a patch to do this properly, please don't hesitate.

[1] https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick/darwin.bash
