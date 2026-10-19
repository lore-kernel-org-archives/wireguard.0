Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21628606A31D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 06:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=k8WEWSz8
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a68337b3;
	Mon, 26 Oct 2026 05:28:47 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 1ad44f22
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Oct 2026 06:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
 MIME-Version; bh=ouIRLFDyuaoVKWuNkHHSxNTL0+gpWtWOu+dvUhZxpMk=;
 b=k8WEWSz8Z3iUdELYLxpgq9l6ndC0gwd4mqzvldhu0tR8eqjN/z91SwhtoRPnie
 9elFKZnSmpaW4dKGVIRihQyNgW+5ZJZmO962pTDsCbyrOK+n0QynEYkzkH5QsWkg
 NpNBaZcf2nBkqWCWgmM5GXV8UhmkUvSsTVTP9fGiJt2QY=
Received: from DESKTOP-HSGK5SH.lan (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wDnXwdKu9VqNrmpAw--.50440S2; 
 Mon, 19 Oct 2026 14:40:10 +0800 (CST)
From: stonege01@163.com
To: wireguard@lists.zx2c4.com
Subject: wireguard-nt 1.1: 0xD1 in PubkeyHashtableLookup (double evaluation of
 PubkeyBucket)
Date: Mon, 19 Oct 2026 14:39:48 +0800
Message-ID: <179239198873.5912.10597979367322198780@163.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnXwdKu9VqNrmpAw--.50440S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ww4DXw43CF13KrWDAF4fZrb_yoW7WF43pr
 W5GFZ8Crs5JFyrur4vvry8AryrC395Aa13u34UJw1qyFs8Cr1Fqryrt3y7Wa9rZrZ5CanF
 qr4DAa1qvFs5CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRS38rUUUUU=
X-CM-SenderInfo: xvwr0vljhqiqqrwthudrp/xtbC5AsRtWrVu0uFygAA3L
X-Mailman-Approved-At: Mon, 26 Oct 2026 05:28:33 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

I would like to report a 0xD1 in wireguard.sys 1.1.0.0 (wireguard-nt 1.1,
tag fef7bc4) and a root cause I believe is in PubkeyHashtableLookup().

Two crash dumps from the same machine (10 days apart) show the same
instruction and the same arguments, so this is deterministic code and not
random memory corruption.

=3D=3D Environment =3D=3D
- Windows 11 Pro 26200 (10.0.26200.9168), x64, 8 logical CPUs
- wireguard.sys 1.1.0.0, timestamp Thu May 7 04:35:56 2026 (0x69FBA62C),
  checksum 0x887D0, PDB stripped (CodeView signature zero)
- loaded through the embeddable wireguard.dll 1.1
- the application is a WireGuard-based mesh VPN that frequently removes and
  re-adds peers to force an immediate handshake after an endpoint change
  (updating the endpoint does not reset the handshake retransmit timer).
  Traffic is continuous while this happens. Any application that removes
  peers while handshakes are in flight could hit the same race.

=3D=3D Crashes =3D=3D
Both are DRIVER_IRQL_NOT_LESS_OR_EQUAL (0xD1):

  2026-10-09 17:26:09 +08:00
    0xD1 (0xfffffffffffffea8, 0x0000000000000002,
          0x0000000000000000, 0xfffff8039ce1f8d3)
    wireguard base 0xfffff8039ce00000 -> offset 0x1f8d3

  2026-10-19 09:10:30 +08:00
    0xD1 (0xfffffffffffffea8, 0x0000000000000002,
          0x0000000000000000, 0xfffff801669df8d3)
    wireguard base 0xfffff801669c0000 -> offset 0x1f8d3

Arg1 =3D -0x158, Arg2 =3D 2 (DISPATCH_LEVEL), Arg3 =3D 0 (read).

=3D=3D Crash site =3D=3D
!analyze -v:

  FAULTING_IP:
  wireguard+1f8d3
  fffff801`669df8d3 483b0411  cmp rax,qword ptr [rcx+rdx]

Surrounding code (inlined memcmp):

  wireguard+0x1f8d0  488b01      mov rax,[rcx]
  wireguard+0x1f8d3  483b0411    cmp rax,[rcx+rdx]
  ...

Raw stack return addresses (innermost first):

  wireguard+0x1f8d3
  wireguard+0x174a5
  wireguard+0x15463
  wireguard+0x18fdf
  tcpip!UdpDeliverDatagrams

0x174a5 is inside PubkeyHashtableLookup(). Disassembly there:

  call siphash              ; first evaluation of PubkeyBucket()
  mov  r9,[bucket]
  test r9,r9
  je   done                 ; first load is checked for NULL
  call siphash              ; second evaluation of PubkeyBucket()
  mov  rbx,[bucket]         ; second load is NOT checked
  add  rbx,-5E0h            ; CONTAINING_RECORD(..., WG_PEER, PubkeyHash)
  lea  rdx,[rbx+488h]       ; &peer->Handshake.RemoteStatic
  mov  r8d,20h
  call memcmp

=3D=3D Root cause =3D=3D
driver/peerlookup.c:

  HLIST_FOR_EACH_ENTRY_RCU (IterPeer, PubkeyBucket(Table, Pubkey), PubkeyHash)

driver/containers.h:

  #define HlistEntry(Ptr, Type, Member) CONTAINING_RECORD(Ptr, Type, Member)
  #define HlistEntrySafe(Ptr, Type, Member) ((Ptr) ? HlistEntry(Ptr, Type, Me=
mber) : NULL)
  #define HLIST_FOR_EACH_ENTRY_RCU(Pos, Head, Member) \
      for (Pos =3D HlistEntrySafe(RcuDereference(HlistFirstRcu(Head)), ...); =
Pos; \
           Pos =3D HlistEntrySafe(RcuDereference(HlistNextRcu(&(Pos)->Member)=
), ...))

HlistEntrySafe() evaluates Ptr twice. Here Ptr contains
PubkeyBucket(Table, Pubkey), which calls Siphash() and indexes the table,
so the complete bucket lookup (SipHash + bucket read) is evaluated twice.
The first result is checked for NULL, the second is used unchecked.

If a concurrent PeerRemove() empties the bucket between the two
evaluations, the second read returns NULL,
CONTAINING_RECORD(NULL, WG_PEER, PubkeyHash) becomes -0x5E0, and
&peer->Handshake.RemoteStatic becomes -0x5E0 + 0x488 =3D -0x158.
memcmp() then reads -0x158 at DISPATCH_LEVEL, which matches Arg1/Arg2/Arg3.

Racing paths:
  PubkeyHashtableLookup()
    <- NoiseHandshakeConsumeInitiation() (receive.c:87, noise.c:644)
    <- NoiseHandshakeConsumeResponse()   (receive.c:107, noise.c:740)
  PubkeyHashtableRemove()
    <- PeerRemove()
    <- WG_IOCTL_PEER_REMOVE (ioctl.c)

The lookup is RCU/lock-free and is not serialized against PeerRemove().
Data packets use IndexHashtableLookup(), not the public-key table.

The PDB is stripped (CodeView signature zero), so the offsets above come
from the disassembly; 0x5E0 and 0x488 are consistent across both dumps and
explain Arg1 exactly.

=3D=3D Suggested fix =3D=3D
Evaluate the bucket only once:

  HLIST_HEAD *Bucket =3D PubkeyBucket(Table, Pubkey);
  HLIST_FOR_EACH_ENTRY_RCU (IterPeer, Bucket, PubkeyHash) { ... }

MSVC has no statement expressions, so a local variable at the call site is
the simplest safe form. This keeps the lookup lock-free.

=3D=3D Suggested API improvement (separate issue) =3D=3D
Applications that need a forced re-handshake currently have to remove and
re-add the peer, because SetConfiguration(endpoint=3D...) does not reset
TimerRetransmitHandshake/TimerHandshakeAttempts. A
WIREGUARD_PEER_FLAG_RESET (clear keypairs and handshake timers, keep the
peer in PeerList/PeerHashtable/AllowedIPs) would allow forced re-handshake
without touching the hash table, and would avoid this race class.

=3D=3D Evidence =3D=3D
I can provide on request:
- both minidumps (~3.4 MB and ~3.6 MB),
- full !analyze -v output,
- disassembly of +0x174a5 and +0x1f8d3,
- WER reports.

The list may strip large attachments; please tell me where to send them
and I will send them off-list, or provide a temporary link.

I am happy to test a patched driver/DLL build on Windows 11 26200 with
continuous traffic and repeated peer add/remove.

Thanks,
[your name]

