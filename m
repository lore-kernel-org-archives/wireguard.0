Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9d622dd
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 20:07:29 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bf1b220
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 20:07:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id feffa681
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 20:07:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ea266ec6
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 20:07:29 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id b126so127396724oia.2
 for <wireguard@lists.zx2c4.com>; Sun, 18 Dec 2016 12:14:19 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 18 Dec 2016 21:14:18 +0100
Message-ID: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
Subject: openwrt route_allowed_ips is inprecise
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
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

Hey Dan,

The route_allowed_ips directive is not precise enough. I'm CCing Jorg,
the NixOS maintainer, because this same concern probably applies to
the Nix logic.

Your code is:

  if [ ${route_allowed_ips} -ne 0 ]; then
   for allowed_ip in ${allowed_ips}; do
     case "${allowed_ip}" in
       *:*/*)
         proto_add_ipv6_route "${allowed_ip%%/*}" "${allowed_ip##*/}"
       ;;
       */*)
         proto_add_ipv4_route "${allowed_ip%%/*}" "${allowed_ip##*/}"
       ;;
     esac
   done
 fi

The way it should be done is described in wg-config:

https://git.zx2c4.com/WireGuard/tree/contrib/examples/wg-config/wg-config#n130

    if [[ $AUTO_ROUTE -eq 1 ]]; then
        for i in $(wg show "$INTERFACE" allowed-ips | cut -f 2 | tr -d ,); do
            if ! add_default "$i" && [[ $(ip route get "$i") != *dev\
$INTERFACE\ * ]]; then
                add_route "$i"
            fi
        done
    fi

The add_default thing just accounts for dealing with 0/1 128/1, which
you can ignore, since openwrt has the dependency mechanism. But the
important thing is that I run `ip route get` for each one, and only
add a route if necessary.

FYI.

Jason
