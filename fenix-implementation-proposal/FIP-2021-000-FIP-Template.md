# FIP 1 --- Fenix Implementation Proposal Template

**Author** ...
**Status** [Approved, Draft, Active, Denied]
**Type** [Standards Track | Informational | Process]
**Created** 2021-01-27
**Resolution**

## Abstract

FIP are a formal process whereby important changes are proposed and
discussed. Corresponding to each FIP is a document that outlines the
proposed change(s), the discussion around those changes, and motivation for
that change. This document outlines the details of the FIP process and
corresponding documents.

## What is a FIP?

FIP stands for "Fenix Enhancement Proposal". FIPs represent a formal
process whereby important changes are proposed and discussed in the Fenix
community. Corresponding to each FIP is a FIP document which outlines
the proposal and corresponding discussion. FIPs are based on
[PEP](https://www.python.org/dev/peps/) process used by the Python language
community to propose changes to the Python language. It also takes motivations
from other similar processes in communities adjacent to Fenix, such as the
[NEP](https://numpy.org/neps/nep-0000.html) process for NumPy and the
[MEP](https://matplotlib.org/devel/MEP/index.html) process for Matplotlib.
However, the FIP process differs from these processes in many ways, so
those who may already be familiar with similar processes from other
communities should read this document to understand how it works for FIPs.

In particular, FIPs are significantly less formal than Python PEPs.

## Types

There are three kinds of FIPs:

A **Standards Track** FIP describes a new feature or important change for
Fenix.

An **Informational** FIP describes a Fenix design issue, or provides general
guidelines or information to the Python community, but does not propose a new
feature. Informational FIPs do not necessarily represent a Fenix community
consensus or recommendation, so users and implementers are free to ignore
Informational FIPs or follow their advice.

A **Process** FIP describes a process surrounding Fenix, or proposes a
change to (or an event in) a process. Process FIPs are like Standards Track
FIPs but apply to areas other than the Fenix library itself. They may
propose an implementation, but not to Fenix’s codebase; they require community
consensus. Examples include procedures, guidelines, changes to the
decision-making process, and changes to the tools or environment used in Fenix
development. Any meta-FIP is also considered a Process FIP.

## Purpose

The FIP process and corresponding documents serve several purposes:

- To decide, as a community, whether a proposed change should be made.
- To decide on the process by which a change will be implemented, for example,
  whether the change should be implemented in several stages, whether
  intermediate releases are required for things like deprecations, and so on.
- To document the above discussions and decisions for future reference.
- To document the motivations for a change from the perspective of end users
  who may be affected by it. Here "end users" means both users of the Fenix
  library, as well as developers working on parts of Fenix itself which may be
  affected by the change.

Importantly, **a FIP is not documentation** for the proposed change. End
user documentation should be included with the implementation of the feature
in the corresponding Fenix documentation. This also means that other
documentation should not cross-reference a FIP as if it were documentation
for a feature. Even technical discussion of a feature should be documented
separately from a FIP. The reason is that FIPs will necessarily include
details that are irrelevant to the final implementation, such as discussions
of alternate implementations which were rejected and discussions of
implementation of the change.

## FIP Workflow

Discussions around a proposed change may begin informally on the mailing list
or Fenix issue tracker. However, once it is decided that the formal FIP
process is desired for a change, the discussion should move to the
[FIP repository](https://github.com/fenix-project/design) on GitHub.

Every FIP must have a champion. This is a person who is responsible for
writing the FIP, leads the discussion around it, and tries to create
consensus around it.

The author of a FIP should fork the repository and create a pull request
with a new FIP document based on the [FIP template](FIP-template).
The FIP document may be named `FIP-YYYY-XX.md` until a number is assigned.
One of the core Fenix developers will then assign a number to the FIP, in
which case `XXXX` should be replaced with the number with leading 0s. The
person who assigns the number should also update the
[README](https://github.com/fenix-project/design/blob/main/README.md) of the main
[FIP repository](https://github.com/fenix-project/design) to list that number.
Numbers should be assigned to FIPs as soon as it is determined that they
are a legitimate proposal. If a FIP ends up being rejected or postponed, it
keeps its number, as rejection or postponement status is still a discussion
that should be documented in the FIP. FIP numbers should generally be
assigned in increasing numeric order.

Discussion on the FIP should then continue on the FIP pull request.
Discussions may also take place in other places, such as [GitHub
discussions](https://github.com/fenix-project/design/discussions) or the [mailing
list](http://groups.google.com/group/Fenix). All discussions should be
cross-referenced in the "Discussions" section of the FIP document.

For each FIP, the community should decide whether a draft implementation is
needed before acceptance or not. For instance, if a FIP concerns the
details of how a feature is implemented, it should be accepted before that
happens. On the other hand, the community may decide that it cannot come to a
consensus about a FIP until a draft implementation is proposed.

Once the community reaches a consensus about a FIP, the status of a FIP
should be updated (see below). This consensus may be to accept or to reject
the FIP, or to defer it. Here the "community" refers to the broader
community that has a stake in the FIP, not just the core Fenix developers.
The purpose of the FIP process is not to create a cabal of decision makers,
but rather to enhance the involvement of the broader Fenix community in the
decision making process.

### Status

The **status** section at the top of the FIP document (see the
[template](FIP-template)) should be updated according to the current status
of the FIP.

All FIPs should be created with the **Draft** status. **Draft** status
FIPs generally live in a pull request.

Eventually, after discussion, there may be a consensus that the FIP should
be accepted–see the next section for details. At this point the status
becomes **Accepted**.

Once a FIP has been **Accepted**, the reference implementation must be
completed. When the reference implementation is complete and incorporated into
the main source code repository, the status will be changed to **Final**.

A FIP can also be assigned status **Deferred**. The FIP author or a core
developer can assign the FIP this status when no progress is being made on
the FIP.

A FIP can also be **Rejected**. Perhaps after all is said and done it was
not a good idea. It is still important to have a record of this fact. The
**Withdrawn** status is similar—it means that the FIP author themselves has
decided that the FIP is actually a bad idea, or has accepted that a
competing proposal is a better alternative.

FIPs can also be **Superseded** by a different FIP, rendering the
original obsolete.

Process FIPs may also have a status of **Active** if they are never meant
to be completed, e.g. FIP 1 (this FIP).

### Merging the FIP Document Pull Request

Whenever a FIP moves from the **Draft** status to one of the other above
statuses, the header should be updated, and the corresponding pull request
should be merged. This way the document lives inside of the FIP repository
proper. FIPs that are merged are not set in stone, and may be updated by
future pull requests (although FIPs that are **Accepted** should generally
not be significantly modified once they have reached that status). The purpose
of merging is simply to make the FIP visible in the repository, even if it
isn't yet accepted or rejected. FIP discussions that have stalled should
also be merged, so that the FIP becomes visible in the FIP repository
proper—again, discussion may be picked up again with a new pull request.

## Accepting a FIP

Once a FIP is Accepted by consensus of all interested contributors, an
email should be sent to the [Fenix mailing
list](http://groups.google.com/group/Fenix) with a subject like:

    Proposal to accept FIP #<number>: <title>

In the body of your email, you should:

- link to the latest version of the FIP,

- briefly describe any major points of contention and how they were resolved,

- include a sentence like: “If there are no substantive objections within 7
  days from this email, then the FIP will be accepted; see FIP 1 for
  more details.”

After you send the email, add the the email thread to the Discussion section
of the FIP, so that people can find it later.

Generally the FIP author will be the one to send this email, but anyone can
do it – the important thing is to make sure that everyone knows when a FIP
is on the verge of acceptance, and give them a final chance to respond. If
there’s some special reason to extend this final comment period beyond 7 days,
then that’s fine, just say so in the email. It shouldn’t be less than 7 days,
because sometimes people are traveling or similar and need some time to
respond.

In general, the goal is to make sure that the community has consensus, not
provide a rigid policy for people to try to game. When in doubt, err on the
side of asking for more feedback and looking for opportunities to compromise.

If the final comment period passes without any substantive objections, then
the FIP can officially be marked **Accepted**. A followup email should then
be sent notifying the list. Update the FIP by setting its **Status** to
**Accepted**, and its **Resolution** header to a link to your followup email.
The FIP pull request should be merged at this time, if it hasn't been
already, so that it is visible in the FIP repository proper.

If there are substantive objections, then the FIP remains in Draft state,
discussion continues as normal, and it can be proposed for acceptance again
later once the objections are resolved.

## Discussion

- [Initial mailing list post proposing
  FIPs](https://groups.google.com/forum/#!msg/Fenix/5RVMiWuCjoA/lr64dS1BBAAJ)
- [Fenix/FIPs#2](https://github.com/fenix-project/design/pull/2)

## License

BSD-3-Clause


## Acknowledge

This Implementation Proposal Template was based on
[Fenix Enhancement Proposal](https://github.com/fenix-project/design/blob/68f05463c1f71c06b3c210b4cab552ba4bcda836/FIP-0001.md)
