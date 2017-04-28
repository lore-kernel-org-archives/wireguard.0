Return-Path: mathias@hall-andersen.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2db9d2d0
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Apr 2017 09:15:36 +0000 (UTC)
Received: from mailrelay10.public.one.com (mailrelay10.public.one.com
 [195.47.247.78])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 678a91b2
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Apr 2017 09:15:36 +0000 (UTC)
Subject: Re: potential preshared-key changes
To: wireguard@lists.zx2c4.com
References: <CAHmME9pXHZXfY+ebGQ2KrYPxZwqW7WxNWsi=iMDjsSQcZD3cJw@mail.gmail.com>
From: Mathias <mathias@hall-andersen.dk>
Message-ID: <24fd775a-38aa-d6fa-476f-95cc734d990d@hall-andersen.dk>
Date: Fri, 28 Apr 2017 11:24:35 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9pXHZXfY+ebGQ2KrYPxZwqW7WxNWsi=iMDjsSQcZD3cJw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------809A0B3DC721727EE56A35CB"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------809A0B3DC721727EE56A35CB
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

We should definitely change to per peer PSKs.
Following Storömberg's observations, the following points may also be
worth considering:

1. Partial deployment

Per peer PSK allows organization to deploy PSK to a subset of peers and
have a smooth transition should they wish to implement it later.

2. Compromise of endpoints

All it takes is one compromised endpoint and PQ secrecy fails completely.
If an employee ever leaves his laptop unencrypted and unattended, the PQ
secrecy of all the corporations VPN connections could be lost.

Furthermore, if an administrator suspects this may be the case,
he has to deploy new keys to all endpoints in a PQ secure manner (e.g
sending them over HTTPS is meaningless);
he most likely has to physically install the new PSK on every client!

In case of compromise, the peers public key must be updated regardless
and updating the per peer PSK along with it seems a manageable task.

3. Disclosure of data under a warrant

Suppose the organization deploying Wireguard is forced to decrypt the
data to/from a single peer.
Currently this is not possible, because of forward secrecy, however in a
post-quantum setting it would be.
Limiting the disclosure to a single peer is substantially harder with a
globally shared PSK.
*
*Periodically rotating the PSKs and completely avoiding the case above
is much easier if the PSK is per peer.
*
*4. Public VPN*

*If Wireguard is deployed as a public VPN, there is no hope of PQ
security with a global PSK.
In the case of a per peer PSK, this may be achieved by meeting in person
or exchanging the PSK with PQ crypto, e.g
the overhead of McEliece may be acceptable, since the PSK is only
transfered once.

5. Users and secrets*
*
Since the key is shared, you can count on Alice asking Bob for his VPN
configuration,
you can also count on Bob sending said configuration over email.
Again the PQ security for the entire organization is lost.

As the organization grows, the probability of such an event goes to 1.

Regards,
Mathias

--------------809A0B3DC721727EE56A35CB
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <tt>We should definitely change to per peer PSKs.<br>
      Following </tt><tt><tt>Storömberg's observations, the following </tt>points
      may also be worth considering:<br>
    </tt><tt><br>
      1. Partial deployment<br>
      <br>
      Per peer PSK allows organization to deploy PSK to a subset of
      peers and have a smooth transition should they wish to implement
      it later.<br>
      <br>
      2. Compromise of endpoints<br>
      <br>
      All it takes is one compromised endpoint and PQ secrecy fails
      completely.<br>
      If an employee ever leaves his laptop unencrypted and unattended,
      the PQ secrecy of all the </tt><tt><tt>corporations</tt> VPN
      connections could be lost.<br>
      <br>
      Furthermore, if an administrator suspects this may be the case,<br>
      he has to deploy new keys to all endpoints in a PQ secure manner
      (e.g sending them over HTTPS is meaningless);<br>
      he most likely has to physically install the new PSK on every
      client!<br>
      <br>
      In case of compromise, the peers public key must be updated
      regardless and updating the per peer PSK along with it seems a
      manageable task.<br>
      <br>
      3. Disclosure of data under a warrant<br>
      <br>
      Suppose the </tt><tt><tt>organization</tt> deploying Wireguard is
      forced to decrypt the data to/from a single peer.<br>
      Currently this is not possible, because of forward secrecy,
      however in a post-quantum setting it would be.<br>
      Limiting the disclosure to a single peer is substantially harder
      with a globally shared PSK.<br>
      <b><br>
      </b>Periodically rotating the PSKs and completely avoiding the
      case above is much easier if the PSK is per peer.<br>
    </tt><tt><b><br>
      </b>4. Public VPN<b><br>
        <br>
      </b>If Wireguard is deployed as a public VPN, there is no hope of
      PQ security with a global PSK.<br>
      In the case of a per peer PSK, this may be achieved by meeting in
      person or exchanging the PSK with PQ crypto, e.g<br>
      the overhead of McEliece may be acceptable, since the PSK is only
      transfered once.<br>
      <br>
      5. Users and secrets<b><br>
      </b><br>
      Since the key is shared, you can count on Alice asking Bob for his
      VPN configuration, <br>
      you can also count on Bob sending said configuration over email.<br>
      Again the PQ security for the entire organization is lost.<br>
      <br>
      As the organization grows, the probability of such an event goes
      to 1.<br>
      <br>
      Regards,<br>
      Mathias<br>
    </tt>
  </body>
</html>

--------------809A0B3DC721727EE56A35CB--
